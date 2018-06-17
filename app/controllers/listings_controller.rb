class ListingsController < ApplicationController
  before_action :user_is_agent, only: [:create, :new, :edit, :update]
  def index
    @listings = Listing.all
  end
  def show
    @listing = Listing.find(params[:id])
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
    @listing.image_proxies.build
    @listing.build_location
    @listing.build_price
    @listing.build_house_detail
    @cocoonable = true
  end


  def edit 
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to @listing
    else
      @listing.print_errors
      redirect_to action: :new
    end
  end

  def create
    # The following is a bit hacky. Come up with a better way to do this.
    @new_listing = Listing.new(listing_params.except(:images_attributes))
    @new_listing.agent = current_user.agent
    if @new_listing.save
      # DANGER!!! This shouldn't take place in this thread.
      if in_prod
        copy_and_clean_images @new_listing.image_proxies
      end
      redirect_to @new_listing
    else
      @new_listing.print_errors
      redirect_to action: :new
    end
  end

  def search_results
    query = {} 
    if (search_params[:listing_for] == "rent")
      query[:listing_for] = "rent"
      description += " rent"
    elsif (search_params[:listing_for] == "purchase")
      query[:listing_for] = "sale"     
    end

    if (search_params[:city] && search_params[:city] != "Any")
      query[:city] = search_params[:city]
    end

    if (search_params[:neighborhood] && search_params[:neighborhood] != "Any")
      query[:neighborhood] = search_params[:neighborhood]
    end

    @results = Listing.search_listings(query)
    @result_description = "Type: #{search_params[:listing_for]} | city: #{search_params[:city]} | neighborhood: #{search_params[:neighborhood]}"
  end

  private
    def listing_params
      params.require(:listing).permit(
        :title, 
        :description, 
        :listing_for,
        :image_urls, 
        location_attributes: [:id, :city, :neighborhood],
        price_attributes: [:id, :currency, :amount, :negotiable],
        house_detail_attributes: [:id, :property_type, :floors, :bedrooms, :bathrooms, :area],
        image_proxies_attributes: [:id, :image_id, :image_url, :_destroy])
    end

    def search_params
      params.permit(:listing_for, :property_type, :city, :neighborhood)
    end
end

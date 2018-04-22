class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end
  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
    @listing.images.build
    @listing.build_location
    @listing.build_price
    @listing.build_house_detail
  end

  def create
    # The following is a bit hacky. Come up with a better way to do this.
    @new_listing = Listing.new(listing_params.except(:images_attributes))

    if @new_listing.save
      if Image.store(@new_listing, listing_params[:images_attributes])
        redirect_to @new_listing
      else
        redirect_to action: :new
      end
    else
      @new_listing.print_errors
      redirect_to action: :new
    end
  end

  private
    def listing_without_images
    end
    def listing_params
      params.require(:listing).permit(
        :title, 
        :description, 
        :listing_for,
        location_attributes: [:id, :city, :neighborhood],
        price_attributes: [:id, :currency, :amount, :negotiable],
        house_detail_attributes: [:id, :property_type, :floors, :bedrooms, :bathrooms, :area],
        images_attributes: [:id, :alternate_text, :image, :_destroy])
    end
end

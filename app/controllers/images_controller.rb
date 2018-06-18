class ImagesController < ApplicationController
  def upload
    @new_image = Image.new
    @new_image.image = image_params[0]
    if @new_image.save 
      @uploaded_file = { id: @new_image.id, url: @new_image.image.url }
      render json: @uploaded_file
    else
      @new_image.print_errors  
    end
  end

  def remove_image
    id = params[:id]
    image_to_remove = Image.find(id)
    image_to_remove.remove_image!
    if image_to_remove.destroy
      puts "destroyed "
    end

  end

  private 

    def image_params
      params.require(:files)
    end

end

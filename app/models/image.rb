class Image < ApplicationRecord
  belongs_to :image_owner, polymorphic: true

  # Mount Carrier Wave image uploader
  mount_uploader :image, ImageUploader


  # This is a hack. Please come up with a more standard way if possible.
  def self.store(image_owner, images_attributes)
    images_attributes.values.each do |value|
      if value.has_key? :image
        # Remove the :_destroy key. 
        value.delete :_destroy
        if image_owner && value[:image]
          new_image = Image.new
          new_image.image_owner = image_owner
          new_image.image = value[:image]
          # If it is not possible to save this image with the given records,
          # print the error and return false.
          if !new_image.save
            new_image.print_errors
            return false
          end
        else
          puts "Invalid params"
          return false
        end
      end
    end
    return true
  end
end

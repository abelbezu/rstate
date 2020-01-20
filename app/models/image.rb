require 'aws-sdk-s3'

class Image < ApplicationRecord
  # Mount Carrier Wave image uploader
  mount_uploader :image, ImageUploader

  def upload_to_s3 path
    s3 = Aws::S3::Resource.new(
      region: ENV.fetch("AWS_REGION")
    )
    bucket = ENV.fetch("AWS_BUCKET_NAME")
    name = File.basename(file)
    obj = s3.bucket(bucket).object(name)
    obj.upload_file(file)
  end
end

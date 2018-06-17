require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.fog_credentials = {
    # Configuration for Amazon S3
    :provider              => 'AWS',
    :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
    :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
    :region                => ENV['AWS_REGION'],
  }

  # For development and testing, upload files to local `tmp` folder.
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    # config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end
  config.fog_directory    = ENV['S3_BUCKET_NAME']
end
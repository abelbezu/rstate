class Listing < ApplicationRecord
  has_one :house_detail
  has_one :price
  has_one :location

  has_many :images, as: :image_owner
  
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :location, allow_destroy: true
  accepts_nested_attributes_for :price, allow_destroy: true
  accepts_nested_attributes_for :house_detail, allow_destroy: true
end

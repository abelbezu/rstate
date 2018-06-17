class Agent < ApplicationRecord
  belongs_to :user

  has_one :image_proxy, as: :proxy_owner, dependent: :destroy
  has_many :listings
  accepts_nested_attributes_for :image_proxy, allow_destroy: true
end

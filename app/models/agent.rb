class Agent < ApplicationRecord
  belongs_to :user

  has_one :image_proxy, as: :proxy_owner, dependent: :destroy
  has_many :listings
end

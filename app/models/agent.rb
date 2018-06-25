class Agent < ApplicationRecord
  belongs_to :user

  has_one :image_proxy, as: :proxy_owner, dependent: :destroy
  has_many :listings
  accepts_nested_attributes_for :image_proxy, allow_destroy: true

  def get_interest_indications
    interest_inds = []
    self.listings.each do |listing|
      listing.interest_indications.each do |ii|
        interest_inds << ii
      end
    end
    return interest_inds
  end
end

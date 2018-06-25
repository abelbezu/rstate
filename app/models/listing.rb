class Listing < ApplicationRecord
  has_one :house_detail
  has_one :price
  has_one :location


  has_many :image_proxies, as: :proxy_owner, dependent: :destroy
  has_many :interest_indications

  belongs_to :agent
  
  accepts_nested_attributes_for :image_proxies, allow_destroy: true
  accepts_nested_attributes_for :location, allow_destroy: true
  accepts_nested_attributes_for :price, allow_destroy: true
  accepts_nested_attributes_for :house_detail, allow_destroy: true


  def self.search_listings(query)
      search_query = {}
      if (query[:listing_for])
        search_query[:listing_for] = query[:listing_for]
      end

      if (query[:city])
        search_query[:locations] ||= {}
        search_query[:locations][:city] = query[:city]
      end

      if (query[:neighborhood])
        search_query[:locations] ||= {}
        search_query[:locations][:neighborhood] = query[:neighborhood]
      end

      # house_details: {property_type: "*"}}
      return Listing.joins(:location, :house_detail).where(search_query)


  end

  def is_owned_by_user(user)
    return user.agent && agent == user.agent
  end

end

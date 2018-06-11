require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  test "should not save article without title" do
    listing = Listing.new
    assert_not listing.save
  end
end

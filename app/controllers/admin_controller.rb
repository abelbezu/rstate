class AdminController < ApplicationController
  layout "admin_layout"
  def index
  end 

  def users
    @users = User.all
  end

  def listings
    @listings = Listing.all
  end

  def agents
  end

  def analytics
  end

end

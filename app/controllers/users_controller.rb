class UsersController < ApplicationController
  before_action :user_signed_in
  before_action :user_is_agent, only: [:user_listings]
  def show
  end

  def user_listings
    @listings = current_user.agent.listings
  end

  def user_messages
    @listings = current_user.agent.listings
  end

  def log_out
    redirect_to destroy_user_session_path
  end
end

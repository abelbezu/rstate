class UsersController < ApplicationController
  def show
  end

  def log_out
    redirect_to destroy_user_session_path
  end
end

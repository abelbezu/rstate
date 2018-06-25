class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def in_prod
    puts ENV.fetch("RAILS_ENV")
    return ENV.fetch("RAILS_ENV") == "production"
  end

  # This is bad. Do this in other threads
  def copy_and_clean_images image_proxies
    image_proxies.each do |image_proxy|
      image_proxy.upload_and_clean
    end
  end

  def user_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def user_is_agent 
    # This should redirect to 404 page.
    unless user_signed_in? && current_user.is_agent
      redirect_to controller: :listings, action: :index
    end
  end

end

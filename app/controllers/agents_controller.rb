class AgentsController < ApplicationController
  before_action :user_signed_in
  def new 
    @agent = Agent.new
    @agent.build_image_proxy
  end
  def create
    new_agent = Agent.new(agent_params)
    new_agent.user = current_user
    if new_agent.save 
      current_user.promote_to_agent
      redirect_to user_path(new_agent)
    else
      new_agent.print_errors
      redirect_to root_url
    end
  end

  def update
  end

  def destroy
  end

  private 
    def agent_params
      params.require(:agent).permit(
        :first_name, 
        :last_name, 
        :phone_number,
        image_proxy_attributes: [:id, :image_id, :image_url, :_destroy])
    end
end

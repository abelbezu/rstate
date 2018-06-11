class AgentsController < ApplicationController

  def new 
    @agent = Agent.new
  end
  def create
    new_agent = Agent.new(agent_params)
    new_agent.user = User.find(1)
    if new_agent.save 
      redirect_to user_path(User.find(1))
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
        image_proxy_attributes: [:id, :image_id, :image_url, :_destroy])
    end
end

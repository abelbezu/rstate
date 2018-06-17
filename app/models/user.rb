class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :agent


  def promote_to_agent
    self.update!({role: "agent"})
  end


  def is_agent
    return self.role == "agent" || self.role == "admin"
  end

end

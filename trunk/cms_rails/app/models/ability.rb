class Ability
  include CanCan::Ability

  def initialize(user)
  	if user
      	can :manage, Project, :owner_id => user.id
    end
  end

end
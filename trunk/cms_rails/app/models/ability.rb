class Ability
  include CanCan::Ability

  def initialize(user, project)
  	if user and !project
      if user.admin?
        can :manage, :all
      else
        can :manage, User, :id => user.id
      	can :manage, Project, :owner_id => user.id
        can :manage, Resource, :user_id => user.id
        can :manage, Announcement, :owner_id => user.id
      end
    end
    if user and project
      if user.admin?
        can :manage, :all
      else
        can :manage, User, :id => user.id
      	can :manage, Project, :owner_id => user.id
        can :manage, Resource, :user_id => user.id
        can :manage, Resource, :project_id => project.id
        can :manage, Announcement, :owner_id => user.id
      end
    end
  end
  end
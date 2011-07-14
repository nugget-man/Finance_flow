class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
     if user.role=="admin"
       can :manage, :all
     elsif user.role? :management
       can :manage, :all
     elsif user.role? :finance
       can :read, :all
     elsif user.role? :sales
       can :read, :all
     else
       can :read, :all
     end
  end
end

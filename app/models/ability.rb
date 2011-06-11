
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :admin
      can :manage, :all
    elsif user.role? :management
      can :manage, [Customer, User]
    elsif user.role? :finance
      can :read, User
    end
  end
end
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, :admin_dashboard if user.admin?
  end
end

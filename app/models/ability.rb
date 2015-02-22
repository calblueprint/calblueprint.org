class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is_a? Admin
      can :manage, :admin_dashboard
    elsif user.is_a? Applicant
      can :create, :application
    end
  end
end

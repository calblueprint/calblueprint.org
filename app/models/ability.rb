class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a? Admin
      can :manage, :all
    elsif user.is_a? Applicant
      can :create, :application
    end
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a? Admin
      can :read, NonprofitApplication, state: 'submitted'
      can :read, Nonprofit

      if user.student_reviewer?
        can :read, StudentApplication
        can :read, Settings
      elsif user.super_admin?
        can :manage, :all
      end
    end
  end
end

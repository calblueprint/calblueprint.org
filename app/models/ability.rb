class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a? Admin
      can :read, NonprofitApplication, state: 'submitted'
      can :read, Nonprofit

      if user.student_reviewer?
        can [:read, :remaining], StudentApplication
        can :read, ExternalApplication
        can :read, Settings
        can :read, Admin
      elsif user.super_admin?
        can [:create, :read], Comparison
        can :manage, :all
      end
    end
  end
end

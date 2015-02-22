module DeviseSettings
  extend ActiveSupport::Concern

  included do
    # Allow more params through devise
    before_filter :configure_permitted_parameters, if: :devise_controller?
  end

  # Lets cancancan grab user
  def current_user
    current_admin
  end

  def after_sign_in_path_for(user)
    if user.admin?
      admin_dashboard_path
    elsif user.member?
      root_path
    elsif user.applicant?
      root_path
    else
      fail 'Bad user!'
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:accept_invitation) << [:first_name, :last_name]
  end
end

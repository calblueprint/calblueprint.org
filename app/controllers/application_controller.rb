class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Allow more params through devise
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    if user.admin?
      admin_dashboard_path
    elsif user.member?
      root_path
    else
      fail 'Bad user!'
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:accept_invitation) << [:first_name, :last_name]
  end

  # Helper for authorization
  def deny_access_if!(condition, message = nil)
    message ||= t('access_denied')
    redirect_to root_path, flash: { error: message } if condition
  end
end

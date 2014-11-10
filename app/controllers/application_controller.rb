class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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

  def deny_access_if!(condition, message = nil)
    message ||= t('access_denied')
    redirect_to root_path, flash: { error: message } if condition
  end
end

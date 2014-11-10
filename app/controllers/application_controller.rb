class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def deny_access_if!(condition, message = nil)
    message ||= t('access_denied')
    redirect_to root_path, flash: { error: message } if condition
  end
end

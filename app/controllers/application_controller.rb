class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :load_settings

  include DeviseSettings
  include AuthorizationHelpers

  def load_settings
    @settings = Settings.instance
  end

  def not_found
    render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_settings

  include DeviseSettings
  include AuthorizationHelpers

  def load_settings
    @settings = Settings.instance
  end
end

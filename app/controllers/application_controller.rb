class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :load_settings
  before_action :create_current_semester

  include DeviseSettings
  include AuthorizationHelpers

  def load_settings
    @settings = Settings.instance
  end

  def create_current_semester
    Semester.create_current_semester
  end
end

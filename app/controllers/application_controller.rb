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

  def after_sign_in_path_for(resource)
  	case resource.class
  	when Admin
	  	admin_root_path
	  when Nonprofit
	  	nonprofit_applications_path
	  end
  end
end

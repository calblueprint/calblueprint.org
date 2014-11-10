module AuthorizationHelpers
  extend ActiveSupport::Concern

  included do
    # Handle CanCan access denied
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, flash: { error: exception.message }
    end
  end

  def authorize_admin!
    authorize! :manage, :admin_dashboard
  end
end

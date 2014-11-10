module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_filter :verify_logged_in_admin

    private

    def verify_logged_in_admin
      deny_access_if! !current_user.admin?
    end
  end
end

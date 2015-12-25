module Admins
  class BaseController < ApplicationController
    layout 'admin'

    before_action :authenticate_admin!
    before_action :authorize_admin!

    private

    def authorize_admin!
      authorize! :manage, :admin_dashboard
    end
  end
end

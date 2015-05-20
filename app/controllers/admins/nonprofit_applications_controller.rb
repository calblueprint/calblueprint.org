module Admins
  class NonprofitApplicationsController < BaseController
    def index
      @nonprofit_applications = NonprofitApplication.all
    end
  end
end

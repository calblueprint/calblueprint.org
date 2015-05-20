module Admins
  class NonprofitApplicationsController < BaseController
    def show
      application = NonprofitApplication.find(params[:id])
      @nonprofit_application = NonprofitApplicationDecorator.new application
    end

    def index
      @nonprofit_applications = NonprofitApplication.all
    end
  end
end

module Admins
  class NonprofitApplicationsController < BaseController
    load_and_authorize_resource

    FILTER_TO_QUERY = {
      current: -> { NonprofitApplication.current },
      all: -> { NonprofitApplication.all },
      bp: -> { NonprofitApplication.bp_apps },
      cs169: -> { NonprofitApplication.cs169_apps }
    }.with_indifferent_access

    def show
      application = NonprofitApplication.find(params[:id])
      @nonprofit_application = NonprofitApplicationDecorator.new application
    end

    def index
      @filter = params[:filter_by] || :current
      @nonprofit_applications = FILTER_TO_QUERY[@filter].call
    end

    def destroy
      application = NonprofitApplication.find(params[:id])
      if application.delete
        flash[:success] = t "admins.nonprofit_applications.destroy.success",
                            organization_name: application.organization_name
      else
        flash[:error] = t("admins.nonprofit_applications.destroy.error")
      end
      redirect_to admin_nonprofit_applications_path
    end
  end
end

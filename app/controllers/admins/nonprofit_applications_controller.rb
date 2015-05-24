module Admins
  class NonprofitApplicationsController < BaseController
    def show
      application = NonprofitApplication.find(params[:id])
      @nonprofit_application = NonprofitApplicationDecorator.new application
    end

    def index
      @nonprofit_applications = NonprofitApplication.all
    end

    def destroy
      application = NonprofitApplication.find(params[:id])
      if application.delete
        flash[:success] = "Successfully deleted #{application.nonprofit.organization_name}'s application."
      else
        flash[:error] = t("admin.nonprofit_applications.delete.error")
      end
      redirect_to admin_nonprofit_applications_path
    end
  end
end

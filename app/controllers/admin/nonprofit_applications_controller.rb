class Admin::NonprofitApplicationsController < Admin::BaseController
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
      flash[:success] = t "admin.nonprofit_applications.destroy.success",
                          organization_name: application.organization_name
    else
      flash[:error] = t("admin.nonprofit_applications.destroy.error")
    end
    redirect_to admin_nonprofit_applications_path
  end
end

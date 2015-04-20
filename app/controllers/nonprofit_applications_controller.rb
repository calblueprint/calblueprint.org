class NonprofitApplicationsController < ApplicationController
  before_action :authenticate_nonprofit!

  def new
    @nonprofit_application = NonprofitApplication.new
  end

  def create
    @nonprofit_application = NonprofitApplication.new nonprofit_application_params
    @nonprofit_application.nonprofit = current_nonprofit
    if @nonprofit_application.save
      SendNonprofitApplicationEmail.execute @nonprofit_application
      redirect_to root_path, flash: { success: t("nonprofit_applications.create.success") }
    else
      render :new
    end
  end

  private

  def nonprofit_application_params
    params.require(:nonprofit_application).permit(:purpose)
  end
end

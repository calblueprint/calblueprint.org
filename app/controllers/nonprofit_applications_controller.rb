class NonprofitApplicationsController < ApplicationController
  before_action :authenticate_nonprofit!
  before_action :verify_npo_app_open

  def new
    @nonprofit_application = current_nonprofit.nonprofit_applications.build
  end

  def create
    @nonprofit_application = current_nonprofit.nonprofit_applications.build nonprofit_application_params
    if @nonprofit_application.save
      SendNonprofitApplicationEmail.execute @nonprofit_application
      redirect_to nonprofits_apply_path, flash: { success: t("nonprofit_applications.create.success") }
    else
      render 'new'
    end
  end

  private

  def nonprofit_application_params
    params.require(:nonprofit_application)
      .permit(:purpose, :history, :date_established, :legal,
              :short_summary, :goals, :key_features, :target_audience, :why, devices: [])
      .merge(semester: @settings.current_semester)
  end

  def verify_npo_app_open
    return if @settings.npo_app_open
    redirect_to nonprofits_apply_path, flash: { error: t('nonprofit_applications.closed') }
  end
end

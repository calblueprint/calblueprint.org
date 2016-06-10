class NonprofitApplicationsController < ApplicationController
  before_action :authenticate_nonprofit!
  before_action :verify_app_open

  def new
    @nonprofit_application = current_nonprofit.nonprofit_applications.build
    @default_check_cs169 = params.key?(:cs169) || (@settings.cs169_app_open && !@settings.npo_app_open)
    @disable_cs169_choice = !@settings.cs169_app_open || !@settings.npo_app_open
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

  def authenticate_nonprofit!
    redirect_to new_nonprofit_registration_path,
                flash: { alert: "Please sign up or sign in before continuing." } unless current_nonprofit
  end

  def nonprofit_application_params
    params.require(:nonprofit_application)
      .permit(:cs169_pool, :purpose, :history, :date_established, :legal,
              :short_summary, :goals, :key_features, :target_audience, :why,
              :technical_requirements, :client_status, devices: [])
      .merge(semester: @settings.current_semester)
  end

  def verify_app_open
    return if @settings.npo_app_open || @settings.cs169_app_open
    redirect_to nonprofits_apply_path, flash: { error: t('nonprofit_applications.closed') }
  end
end

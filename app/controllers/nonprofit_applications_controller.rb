class NonprofitApplicationsController < ApplicationController
  before_action :authenticate_nonprofit
  before_action :verify_app_open



  def new
    default_check_cs169 = params.key?(:cs169) || (@settings.cs169_app_open && !@settings.npo_app_open)
    nonprofit_application = current_nonprofit.nonprofit_applications.create(cs169_pool: default_check_cs169,
                                                                            semester: @settings.current_semester)
    redirect_to edit_nonprofit_application_path(id: nonprofit_application.id)
  end

  def edit
    @nonprofit_application = NonprofitApplication.find(params[:id])
    authenticate_nonprofit_application

    @disable_cs169_choice = !@settings.cs169_app_open || !@settings.npo_app_open
    @default_check_cs169 = @nonprofit_application[:cs169_pool]
    @default_client_status = @nonprofit_application[:client_status]
  end

  def save
    nonprofit_application = NonprofitApplication.find(params[:nonprofit_application_id])
    if nonprofit_application.draft? &&
       nonprofit_application.nonprofit == current_nonprofit &&
       nonprofit_application.update_attributes(nonprofit_application_params)
      render json: { success: true }
    else
      render json: { serverErrors: nonprofit_application.errors.messages }, status: :bad_request
    end
  end

  def submit
    @nonprofit_application = NonprofitApplication.find(params[:nonprofit_application_id])
    authenticate_nonprofit_application
    if @nonprofit_application.update_attributes(nonprofit_application_params) && @nonprofit_application.submit
      SendNonprofitApplicationEmail.execute @nonprofit_application
      redirect_to nonprofit_applications_path, flash: { success: t("nonprofit_applications.create.success") }
    else
      @disable_cs169_choice = !@settings.cs169_app_open || !@settings.npo_app_open
      @default_check_cs169 = @nonprofit_application[:cs169_pool]
      render 'edit'
    end
  end

  def index
    @curr_semester = @settings.current_semester
    @nonprofit_applications = current_nonprofit.nonprofit_applications.order(created_at: :DESC)
    @interest_form = current_nonprofit.current_interest_form.first
    @statement_open = @settings.npo_statement_of_interest_open
    @proposal_open = completed_phone_screen

    @draft_nonprofit_applications = []
    @curr_submitted_nonprofit_applications = []
    @old_submitted_nonprofit_applications = []
    @nonprofit_applications.each do |na|
      if na.submitted?
        if na.semester == @settings.current_semester
          @curr_submitted_nonprofit_applications.push(na)
        else
          @old_submitted_nonprofit_applications.push(na)
        end
      elsif na.draft?
        @draft_nonprofit_applications.push(na)
      end
    end

  end

  def revise
    nonprofit_application = NonprofitApplication.find(params[:nonprofit_application_id])
    if nonprofit_application.nonprofit == current_nonprofit
      new_application = NonprofitApplication.create(nonprofit_application.attributes.except("id", "state"))
      redirect_to edit_nonprofit_application_path(id: new_application.id)
    end
  end

  def destroy
    @nonprofit_application = NonprofitApplication.find(params[:id])
    if @nonprofit_application.nonprofit == current_nonprofit && @nonprofit_application.draft? && @nonprofit_application.destroy
      redirect_to nonprofit_applications_path, flash: { success: t("nonprofit_applications.destroy.success") }
    else
      redirect_to nonprofit_applications_path, flash: { error: t("nonprofit_applications.destroy.error") }
    end
  end

  private

  def authenticate_nonprofit
    redirect_to new_nonprofit_session_path,
                flash: { alert: "Please sign up or sign in before continuing." } unless current_nonprofit
  end

  def authenticate_nonprofit_application
    unless @nonprofit_application.nonprofit == current_nonprofit && @nonprofit_application.draft?
      redirect_to root_path, flash: { error: "You are not authorized to access that page" }
    end
  end

  def nonprofit_application_params
    params.require(:nonprofit_application)
      .permit(:cs169_pool, :purpose, :history, :date_established, :legal,
              :short_summary, :goals, :key_features, :inclusivity, :target_audience, :why,
              :technical_requirements, :client_status, :nonprofit_application_id,
              :current_resources, :future_plans, devices: [])
      .merge(semester: @settings.current_semester)
  end

  def verify_app_open
    return if @settings.npo_app_open || @settings.cs169_app_open
    redirect_to nonprofits_apply_path, flash: { error: t('nonprofit_applications.closed') }
  end

  def completed_phone_screen
    if current_nonprofit.nil?
      return false
    end

    # EDIT: Phone screen is optional
    return true

    # Find the current NPO's Airtable record by email address. Use this if phone screen is NOT optional. 
    
    settings = Settings.instance
    semester_str = "#{settings.current_semester.season.capitalize} #{settings.current_semester.year} Applications"
    airtable_npos = Airrecord.table(ENV["AIRTABLE_API"], ENV["AIRTABLE_NPO_TABLE"], semester_str).all
    emails = airtable_npos.map { |npo| npo[:email] }
    pos = emails.index(current_nonprofit.email)
    airtable_npos[pos]["Unlocked Phase 2"]

    if pos.nil?
      false
    else
      airtable_npos[pos]["Unlocked Phase 2"]
    end
  end
end

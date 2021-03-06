class ExternalApplicationsController < ApplicationController
  before_action :verify_external_app_open

  def new
    @external_application = ExternalApplication.new
  end

  def create
    applicant = Applicant.find_or_create_by(email: external_application_params[:email])
    if verify_unique_semester_application applicant
      @external_application = applicant.external_applications.build external_application_params
      if @external_application.save
        applicant.update_attributes(name: @external_application.name)
        SendStudentApplicationEmail.execute @external_application
        redirect_to new_demographic_survey_path, flash: { success: t('student_applications.create.success') }
      else
        render "new"
      end
    end
  end

  def external_application_params
    params.require(:external_application).permit(
      :why_join, :resume, :phone, :year, :major, :applicant_id, :semester_id, :name,
      :email, :experience, :applied_before, :available_for_retreat, :available_for_meet_the_club, :why_no_meet_the_club,
      :available_for_bp_games, :why_no_bp_games, :why_no_retreat, :design_portfolio, :design_portfolio_link,
      :operations, :design, :content, :outreach, :design_experience, :website,
      :additional_option, :social_links, :personal_growth, :commitments).merge(
        semester: @settings.current_semester
      )
  end

  # check if student already applied this semester
  def verify_unique_semester_application(current_applicant)
    return true unless current_applicant.external_applied_for?(@settings.current_semester)
    redirect_to students_apply_path, flash: { error: t('student_applications.create.resubmit') }
    false
  end

  def verify_external_app_open
    # Temp Fix
    redirect_to students_apply_path
    # return if @settings.external_app_open
    # redirect_to students_apply_path, flash: { error: t('student_applications.closed') }
  end

end

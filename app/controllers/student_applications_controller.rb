class StudentApplicationsController < ApplicationController
  before_action :verify_student_app_open

  def new
    @student_application = StudentApplication.new
  end

  def create
    applicant = Applicant.find_or_create_by(email: student_application_params[:email])
    if verify_unique_semester_application applicant
      @student_application = applicant.student_applications.build student_application_params
      if @student_application.save
        applicant.update_attributes(name: @student_application.name)
        SendStudentApplicationEmail.execute @student_application
        redirect_to students_apply_path, flash: { success: t('student_applications.create.success') }
      else
        render "new"
      end
    end
  end

  def student_application_params
    params.require(:student_application).permit(
      :why_join, :heard_from, :commitments, :hardest_achievement, :resume, :design_portfolio, :phone, :year, :applicant_id, :semester_id, :name,
      :email, :experience, :projects, :service, :applied_before,
      :available_for_retreat, :available_for_bp_games, :add_to_newsletter, :why_no_bp_games, :why_no_retreat).merge(
        semester: @settings.current_semester
      )
  end

  def verify_unique_semester_application(current_applicant)
    return true unless current_applicant.applied_for?(@settings.current_semester)
    redirect_to students_apply_path, flash: { error: t('student_applications.create.resubmit') }
    false
  end

  def verify_student_app_open
    return if @settings.student_app_open
    redirect_to students_apply_path, flash: { error: t('student_applications.closed') }
  end
end

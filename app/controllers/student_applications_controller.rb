class StudentApplicationsController < ApplicationController
  before_action :authenticate_applicant!
  before_action :verify_unique_semester_application

  def new
    @student_application = current_applicant.student_applications.build
  end

  def create
    @student_application = current_applicant.student_applications.build student_application_params
    if @student_application.save
      redirect_to students_apply_path, flash: { success: "You have"\
        " successfully submitted an application. You will receive an email shortly." }
    else
      render "new"
    end
  end

  def student_application_params
    params.require(:student_application).permit(:why_join).merge(semester: @settings.current_semester)
  end

  def verify_unique_semester_application
    return true unless current_applicant.applied_for?(@settings.current_semester)
    redirect_to students_apply_path, flash: { success: "You have already"\
      " submitted an application for this semester." }
  end
end

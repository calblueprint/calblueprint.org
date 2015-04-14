class StudentApplicationsController < ApplicationController
  before_action :authenticate_applicant!
  before_action :unique_semester_application

  def new
    @student_application = current_user.student_applications.build
  end

  def create
    @student_application = current_user.student_applications.build student_application_params
    @student_application.semester = Semester.current_semester
    if @student_application.save
      redirect_to students_apply_path, flash: { success: "You have"\
      "successfully submitted an application. You will receive an email shortly." }
    else
      render "new"
    end
  end

  def student_application_params
    params.require(:student_application).permit(:why_join)
  end

  def unique_semester_application
    return true if Semester.current_semester.application_exists(current_user)
    redirect_to students_apply_path, flash: { success: "You have already"\
    "submitted an application for this semester." }
  end
end

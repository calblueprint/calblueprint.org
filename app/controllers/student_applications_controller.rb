class StudentApplicationsController < ApplicationController
  before_action :verify_student_app_open

  def new
    @student_application = StudentApplication.new
    questions = Question.sorted(@settings.current_semester)
    questions.each {|q| @student_application.responses.build question: q}
  end

  def create
    response_params = student_application_params[:responses]
    applicant = Applicant.find_or_create_by(email: response_params[:email])
    if verify_unique_semester_application applicant
      # Start with a fresh student app object
      # TODO: Should really build this using strong params as intended.
      # Just don't have the time right now to fix the form
      @student_application = applicant.student_applications.build

      applicant_name = ""
      # Validate individual responses
      questions = Question.sorted(@settings.current_semester)
      questions.each do |question|
        key = question.tag
        value = response_params[key]

        if value
          if question.question_type == "attachment"
            @student_application.responses.build question: question, file: value
          else
            @student_application.responses.build question: question, answer: value.gsub("\u0000", '')
          end
        else
          # Will be the case for unattached files
          @student_application.responses.build question: question
        end

        if key == "name"
          applicant_name = value
        end
        @student_application.semester = @settings.current_semester
      end

      if @student_application.save
        applicant.update_attributes(name: @student_application.name)
        SendStudentApplicationEmail.execute @student_application
        redirect_to new_demographic_survey_path, flash: { success: t('student_applications.create.success') }
      else
        render "new"
      end
    end
  end

  def student_application_params
    allowed_response_types = QuestionSemester.where(semester: @settings.current_semester).map {|x| x.question.tag.to_sym}
    params.require(:student_application).permit(responses: allowed_response_types).merge(
        semester: @settings.current_semester
      )
  end

  def verify_unique_semester_application(current_applicant)
    return true unless current_applicant.applied_for?(@settings.current_semester)
    redirect_to students_apply_path, flash: { error: t('student_applications.create.resubmit') }
    false
  end

  def verify_student_app_open
    return if @settings.dev_app_open || @settings.designer_app_open == 'open'
    redirect_to students_apply_path, flash: { error: t('student_applications.closed') }
  end
end

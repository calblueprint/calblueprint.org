module Admins
  class StudentApplicationsController < BaseController
    def index
      @student_applications = StudentApplication.order(:id)
      respond_to do |format|
        format.html
        format.csv { send_data @student_applications.to_csv }
      end
      # @student_applications = StudentApplication.all
      # @season = @student_applications.first.semester.season
      # @year = @student_applications.first.semester.year
      
      # respond_to do |format|
      #   format.html
      #   format.csv do
      #     headers['Content-Disposition'] = "attachment; filename=\"Student-Applications-" + @season + @year + "\""
      #     headers['Content-Type'] ||= 'text/csv'
      #   end
      # end
    end

    def import
      StudentApplication.import_decision(params[:file])
      redirect_to admin_student_applications_path, flash: { success: "Student Applicants imported!" }
    end
  end
end

module Admins
  class StudentApplicationsController < BaseController
    def index
      @student_applications = StudentApplication.order(:id)
      respond_to do |format|
        format.html
        format.csv { send_data StudentAppsCsv.to_csv @student_applications }
      end
    end

    def show
      app = StudentApplication.find(params[:id])
      @app = StudentApplicationDecorator.new app
    end

    def import
      # TODO: Bugs out when no file
      StudentAppsCsv.import_decisions params[:file]
      redirect_to admin_student_applications_path, flash: { success: "Student Applicants imported!" }
    end
  end
end

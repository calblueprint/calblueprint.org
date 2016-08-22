module Admins
  class StudentApplicationsController < BaseController
    load_and_authorize_resource

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

    def remaining
      @student_applications = StudentApplication.remaining
    end
  end
end

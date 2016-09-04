module Admins
  class StudentApplicationsController < BaseController
    load_and_authorize_resource

    FILTER_TO_QUERY = {
      current: -> { StudentApplication.current },
      all: -> { StudentApplication.all }
    }.with_indifferent_access

    def index
      filter = params[:filter_by] || :current
      @student_applications = FILTER_TO_QUERY[filter].call.order(wins_count: :desc, losses_count: :asc)
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

module Admins
  class ExternalApplicationsController < BaseController
    load_and_authorize_resource

    def index
      @external_applications = ExternalApplication.where(
        semester_id: Settings.instance.current_semester_id
      )
    end

    def show
      app = ExternalApplication.find(params[:id])
      @app = ExternalApplicationDecorator.new app
    end

  end
end

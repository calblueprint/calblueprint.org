module Admins
  class ExternalApplicationsController < BaseController
    load_and_authorize_resource

    def index
      @external_applications = ExternalApplication.all
    end

    def show
      app = ExternalApplication.find(params[:id])
      @app = ExternalApplicationDecorator.new app
    end

  end
end

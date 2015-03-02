module Admins
  class AppsController < BaseController
    def index
      @apps = App.all
    end
  end
end

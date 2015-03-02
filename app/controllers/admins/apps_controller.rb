module Admins
  class AppsController < BaseController
    before_filter :authenticate_admin!

    def index
      @apps = App.all
    end
  end
end

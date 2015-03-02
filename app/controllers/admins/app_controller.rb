module Admins
  class AppController < ApplicationController
    before_filter :authorize_admin

    def show
      @apps = App.all()
    end
  end
end

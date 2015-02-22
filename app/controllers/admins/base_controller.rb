module Admins
  class BaseController < ApplicationController
    before_action :authenticate_admin!
    before_action :authorize_admin!
  end
end

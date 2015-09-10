class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!
  before_action :authorize_admin!

  private

  def authorize_admin!
    authorize! :manage, :admin_dashboard
  end
end

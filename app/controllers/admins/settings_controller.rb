require 'singleton'

module Admins
  class SettingsController < BaseController
    include Singleton

    def update
      if @settings.update_attributes settings_params
        redirect_to admin_settings_path
      else
        render 'edit'
      end
    end

    def set_current_semester
      @settings.current_semester_id = params[:current_semester_id]
      @settings.save
      redirect_to admin_settings_path
    end

    private

    def settings_params
      params.require(:settings).permit(:npo_app_open, :student_app_open, :current_semester_id)
    end
  end
end

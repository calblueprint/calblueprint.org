module Admins
  class SettingsController < BaseController
    load_and_authorize_resource class: "Settings", param_method: :settings_params

    def update
      if @settings.update_attributes settings_params
        redirect_to admin_settings_path, notice: "Settings updated."
      else
        render 'edit'
      end
    end

    def set_current_semester
      @settings.current_semester_id = params[:current_semester_id]
      @settings.save
      redirect_to admin_settings_path, notice: "Current semester changed."
    end

    private

    def settings_params
      params.require(:settings).permit(
        :npo_app_open, :cs169_app_open, :dev_app_open, :designer_app_open, :current_semester_id,
        :comparison_bonus, :comparison_penalty, :comparison_threshold, :applicants_remaining,
        :external_app_open, :npo_statement_of_interest_open, :npo_project_proposal_open,
        :infosession_one, :infosession_one_link, :infosession_one_date, :infosession_two, :infosession_two_link, :infosession_two_date,
        :notify_bar_active, :notify_bar_admins_only, :notify_bar_content, :notify_bar_link
      )
    end
  end
end

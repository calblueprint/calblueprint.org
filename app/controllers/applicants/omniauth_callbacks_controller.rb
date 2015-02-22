module Applicants
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # rubocop:disable Metrics/MethodLength
    def self.provides_callback_for(provider)
      class_eval %{
        def #{provider}
          @applicant = Applicant.find_for_oauth(env["omniauth.auth"], current_applicant)

          if @applicant.persisted?
            sign_in_and_redirect @applicant, event: :authentication
            set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
          else
            session["devise.#{provider}_data"] = env["omniauth.auth"]
            redirect_to new_user_registration_url
          end
        end
      }
    end

    [:facebook, :google_oauth2].each do |provider|
      provides_callback_for provider
    end
  end
end

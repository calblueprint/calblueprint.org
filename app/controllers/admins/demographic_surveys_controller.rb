module Admins
  class DemographicSurveysController < BaseController
    load_and_authorize_resource

    def index
      @demographic_surveys = DemographicSurvey.where(
        semester_id: Settings.instance.current_semester_id
      )

      @developer_count = @demographic_surveys.where(applicant_type: 'developer').count
      @external_count = @demographic_surveys.where(applicant_type: 'external').count

      @african_american_count = @demographic_surveys.where(african_american: true).count
      @latino_count = @demographic_surveys.where(latino: true).count
      @american_indian_count = @demographic_surveys.where(american_indian: true).count
      @asian_count = @demographic_surveys.where(asian: true).count
      @white_count = @demographic_surveys.where(white: true).count
      @sw_asian_n_african_count = @demographic_surveys.where(sw_asian_n_african: true).count
      @pacific_islander_count = @demographic_surveys.where(pacific_islander: true).count
      @decline_race_count = @demographic_surveys.where(decline_race: true).count
      
      @male_count = @demographic_surveys.where(male: true).count
      @female_count = @demographic_surveys.where(female: true).count
      @nonbinary_count = @demographic_surveys.where(nonbinary: true).count
      @transgender_count = @demographic_surveys.where(transgender: true).count
      @intersex_count = @demographic_surveys.where(intersex: true).count
      @two_spirit_count = @demographic_surveys.where(two_spirit: true).count
      @gender_nonconforming_count = @demographic_surveys.where(gender_nonconforming: true).count
      @something_else_gender_count = @demographic_surveys.where(something_else_gender: true).count
      @decline_gender_count = @demographic_surveys.where(decline_gender: true).count
      @other_genders = @demographic_surveys.where(other_gender: present?)
    end
  end
end

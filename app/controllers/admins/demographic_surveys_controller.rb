module Admins
  class DemographicSurveysController < BaseController
    load_and_authorize_resource

    def index
      @demographic_surveys = DemographicSurvey.where(
        semester_id: Settings.instance.current_semester_id
      )

      @developer_count = @demographic_surveys.where(applicant_type: 'developer').count
      @designer_count = @demographic_surveys.where(applicant_type: 'designer').count
      @external_count = @demographic_surveys.where(applicant_type: 'external').count

      @ethnicities = {}
      Ethnicity.all.each do |e|
        @ethnicities[e.name] = e.demographic_surveys.where(semester_id: Settings.instance.current_semester_id).count
      end
      
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

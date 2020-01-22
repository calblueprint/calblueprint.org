class CreateJoinTableDemographicSurveyEthnicity < ActiveRecord::Migration[5.2]
  def change
    create_join_table :demographic_surveys, :ethnicities do |t|
      # t.index [:demographic_survey_id, :ethnicity_id]
      # t.index [:ethnicity_id, :demographic_survey_id]
    end
  end
end

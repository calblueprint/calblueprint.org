class AddDeclineSiToDemographicSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :demographic_surveys, :decline_sexual_identity_orientation, :boolean
  end
end

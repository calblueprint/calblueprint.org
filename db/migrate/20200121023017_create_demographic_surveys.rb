class CreateDemographicSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :demographic_surveys do |t|
      t.references :semester, foreign_key: true
      t.boolean :african_american
      t.boolean :latino
      t.boolean :american_indian
      t.boolean :asian
      t.boolean :white
      t.boolean :sw_asian_n_african
      t.boolean :pacific_islander
      t.boolean :male
      t.boolean :female
      t.boolean :nonbinary
      t.boolean :transgender
      t.boolean :intersex
      t.boolean :two_spirit
      t.boolean :gender_nonconforming
      t.boolean :something_else_gender
      t.string :other_gender
      t.boolean :decline_gender
      t.boolean :decline_race
      t.integer :applicant_type

      t.timestamps
    end
  end
end

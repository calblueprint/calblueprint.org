class AddFieldsToDemographicSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :demographic_surveys, :additional_gender_notes, :string
    add_column :demographic_surveys, :additional_sexual_identity_orientation_notes, :string
    add_column :demographic_surveys, :asexual, :boolean
    add_column :demographic_surveys, :bisexual, :boolean
    add_column :demographic_surveys, :gay, :boolean
    add_column :demographic_surveys, :lesbian, :boolean
    add_column :demographic_surveys, :pansexual, :boolean
    add_column :demographic_surveys, :queer, :boolean
    add_column :demographic_surveys, :questioning_or_unsure, :boolean
    add_column :demographic_surveys, :same_gender_loving, :boolean
    add_column :demographic_surveys, :straight, :boolean
    add_column :demographic_surveys, :other_sexual_identity_orientation, :boolean
  end
end

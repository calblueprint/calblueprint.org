class AddOutreachPositionToExternalApplications < ActiveRecord::Migration[4.2]
  def change
    add_column :external_applications, :outreach, :boolean
  end
end

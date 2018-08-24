class AddOutreachPositionToExternalApplications < ActiveRecord::Migration
  def change
    add_column :external_applications, :outreach, :boolean
  end
end

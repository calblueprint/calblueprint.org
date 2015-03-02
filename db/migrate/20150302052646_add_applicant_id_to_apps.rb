class AddApplicantIdToApps < ActiveRecord::Migration
  def change
    add_column :apps, :applicant_id, :integer
    add_index :apps, :applicant_id
  end
end

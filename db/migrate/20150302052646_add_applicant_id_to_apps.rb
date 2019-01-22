class AddApplicantIdToApps < ActiveRecord::Migration[4.2]
  def change
    add_column :apps, :applicant_id, :integer
    add_index :apps, :applicant_id
  end
end

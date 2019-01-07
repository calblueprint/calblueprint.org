class AddSemesterIdToApps < ActiveRecord::Migration[4.2]
  def change
    add_column :apps, :semester_id, :integer
    add_index :apps, :semester_id
  end
end

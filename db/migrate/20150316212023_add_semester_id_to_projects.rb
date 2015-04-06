class AddSemesterIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :semester_id, :integer
    add_index :projects, :semester_id
  end
end

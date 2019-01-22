class AddCountsToStudentApplication < ActiveRecord::Migration[4.2]
  def change
    add_column :student_applications, :wins_count, :integer, default: 0
    add_column :student_applications, :losses_count, :integer, default: 0
  end
end

class AddCountsToStudentApplication < ActiveRecord::Migration
  def change
    add_column :student_applications, :wins_count, :integer, default: 0
    add_column :student_applications, :losses_count, :integer, default: 0
  end
end

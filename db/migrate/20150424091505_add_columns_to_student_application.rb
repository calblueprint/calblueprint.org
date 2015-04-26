class AddColumnsToStudentApplication < ActiveRecord::Migration
  def change
    add_column :student_applications, :year, :string
    add_column :student_applications, :phone, :string
  end
end

class AddColumnsToStudentApplication < ActiveRecord::Migration[4.2]
  def change
    add_column :student_applications, :year, :string
    add_column :student_applications, :phone, :string
  end
end

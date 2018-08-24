class AddShortFieldsToStudentApplications < ActiveRecord::Migration
  def change
    add_column :student_applications, :commitments, :text
    add_column :student_applications, :heard_from, :string
  end
end

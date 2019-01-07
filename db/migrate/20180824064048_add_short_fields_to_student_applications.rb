class AddShortFieldsToStudentApplications < ActiveRecord::Migration[4.2]
  def change
    add_column :student_applications, :commitments, :text
    add_column :student_applications, :heard_from, :string
  end
end

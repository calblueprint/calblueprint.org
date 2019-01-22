class AddWhyJoinToStudentApplications < ActiveRecord::Migration[4.2]
  def change
    add_column :student_applications, :why_join, :text
  end
end

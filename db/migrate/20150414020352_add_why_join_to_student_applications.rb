class AddWhyJoinToStudentApplications < ActiveRecord::Migration
  def change
    add_column :student_applications, :why_join, :text
  end
end

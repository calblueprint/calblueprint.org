class RenameAppsToStudentApplications < ActiveRecord::Migration
  def change
    rename_table :apps, :student_applications
  end
end

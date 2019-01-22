class RenameAppsToStudentApplications < ActiveRecord::Migration[4.2]
  def change
    rename_table :apps, :student_applications
  end
end

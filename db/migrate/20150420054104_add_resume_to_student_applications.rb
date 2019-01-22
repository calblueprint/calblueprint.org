class AddResumeToStudentApplications < ActiveRecord::Migration[4.2]
  def self.up
    add_attachment :student_applications, :resume
  end

  def self.down
    remove_attachment :student_applications, :resume
  end
end

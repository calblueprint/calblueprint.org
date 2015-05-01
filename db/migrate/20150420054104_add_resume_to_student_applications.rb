class AddResumeToStudentApplications < ActiveRecord::Migration
  def self.up
    add_attachment :student_applications, :resume
  end

  def self.down
    remove_attachment :student_applications, :resume
  end
end

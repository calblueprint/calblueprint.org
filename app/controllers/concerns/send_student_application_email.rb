class SendStudentApplicationEmail
  def self.execute(student_application)
    StudentApplicationMailerJob.new.async.perform student_application
  end
end

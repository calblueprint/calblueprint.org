class StudentApplicationMailerJob
  include SuckerPunch::Job

  def perform(student_application)
    StudentApplicationMailer.email(student_application).deliver_now
  end
end

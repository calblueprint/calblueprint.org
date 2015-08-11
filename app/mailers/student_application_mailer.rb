class StudentApplicationMailer < ActionMailer::Base
  def email(student_application)
    @student_application = student_application
    mail to: student_application.student.email,
          subject: "Submission of student application was successful!"
  end
end

class NonprofitApplicationMailer < ActionMailer::Base
  def email(nonprofit_application)
    @nonprofit_application = nonprofit_application
    mail to: nonprofit_application.nonprofit.email,
         subject: "Submission of nonprofit application was successful!"
  end
end

class NonprofitApplicationMailer < ActionMailer::Base
  default from: "from@example.com"

  def email(nonprofit_application)
    @nonprofit_application = nonprofit_application
    mail to: nonprofit_application.nonprofit.email,
         from: ENV["TEAM_EMAIL"],
         subject: "Submission of nonprofit application was successful!"
  end
end
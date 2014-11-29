class ContactFormMailer < ActionMailer::Base
  default from: "from@example.com"

  def email(contact_form)
    @contact_form = contact_form
    mail to: ENV["TEAM_EMAIL"],
         from: contact_form.email,
         subject: contact_form.subject
  end
end

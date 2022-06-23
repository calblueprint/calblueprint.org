class ContactFormMailer < ActionMailer::Base
  def email(contact_form)
    @contact_form = contact_form
    # mail to: ENV["TEAM_EMAIL"],
    mail to: "projects@calblueprint.org"
         from: contact_form.email,
         subject: contact_form.subject
  end
end

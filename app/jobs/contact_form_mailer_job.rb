class ContactFormMailerJob
  include SuckerPunch::Job

  def perform(contact_form)
    ContactFormMailer.email(contact_form).deliver_now
  end
end

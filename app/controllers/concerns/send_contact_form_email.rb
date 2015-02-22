class SendContactFormEmail
  def self.execute(contact_form)
    ContactFormMailerJob.new.async.perform contact_form
  end
end

class SendContactFormEmail
  def self.execute(contact_form)
    ContactFormMailerWorker.new.async.perform contact_form
  end
end

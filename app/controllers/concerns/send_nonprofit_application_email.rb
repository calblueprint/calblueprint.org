class SendNonprofitApplicationEmail
  def self.execute(nonprofit_application)
    NonprofitApplicationMailerJob.new.async.perform nonprofit_application
  end
end

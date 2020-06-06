class SendNonprofitInterestFormEmail
  def self.execute(nonprofit_interest_form)
    NonprofitInterestFormMailerJob.new.async.perform nonprofit_interest_form
  end
end

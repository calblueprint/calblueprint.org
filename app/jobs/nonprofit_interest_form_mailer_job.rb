class NonprofitInterestFormMailerJob
  include SuckerPunch::Job

  def perform(nonprofit_interest_form)
    NonprofitInterestFormMailer.email(nonprofit_interest_form).deliver_now
  end
end

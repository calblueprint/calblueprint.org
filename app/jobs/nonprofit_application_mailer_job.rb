class NonprofitApplicationMailerJob
  include SuckerPunch::Job

  def perform(nonprofit_application)
    NonprofitApplicationMailer.email(nonprofit_application).deliver_now
  end
end

class NonprofitInterestFormMailer < ActionMailer::Base
  def email(nonprofit_interest_form)
    @nonprofit_interest_form = nonprofit_interest_form
    mail to: nonprofit_interest_form.nonprofit.email,
         subject: "Thanks for submitting the interest form! Looking forward to our call"
  end
end

class NewsletterController < ApplicationController
  def subscribe
    email = params[:email]
    list = params[:list]
    begin
      md5 = Digest::MD5.hexdigest(email.downcase)
      gibbon = Gibbon::Request.new(api_key: ENV["MAILCHIMP_API"])
      gibbon
        .lists(ENV[list])
        .members(md5)
        .upsert(body: { email_address: email, status: "subscribed" })
      render json: {}
    rescue => err
      Rollbar.error(err)
      render json: {}, status: 500
    end
  end
end

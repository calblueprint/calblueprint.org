class NewsletterController < ApplicationController

  def subscribe
    email = params[:email]
    list = params[:list]
    begin
      gibbon = Gibbon::Request.new(api_key: ENV["MAILCHIMP_API"])
      gibbon.lists(ENV[list]).members.create(body: {email_address: email, status: "subscribed"})
      render :json => { }
    rescue =>e
      render :json => { }, :status => 500
    end
  end
end

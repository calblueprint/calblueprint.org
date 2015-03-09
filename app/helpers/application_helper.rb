module ApplicationHelper
  def gravatar_url(email)
    gravatar_hash = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_hash}.png"
  end
end

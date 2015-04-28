module ApplicationHelper
  def gravatar_url(email)
    gravatar_hash = Digest::MD5.hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_hash}.png"
  end

  def class_if?(class, exp)
    exp ? class : nil
  end

  def selected_if?(exp)
    class_if? "selected", exp
  end
end

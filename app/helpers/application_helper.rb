module ApplicationHelper
  def member_image(member, default_url)
    gravatar_hash = Digest::MD5.hexdigest(member['email']).downcase
    image_url = "http://gravatar.com/avatar/#{gravatar_hash}.png?s=200&d=404"
    if HTTParty.get(image_url).code.to_i == 404
      image_url = member['image']
    end
    image_url || default_url
  end


  def class_if?(css_class, exp)
    exp ? css_class : nil
  end

  def selected_if?(exp)
    class_if? "selected", exp
  end
end

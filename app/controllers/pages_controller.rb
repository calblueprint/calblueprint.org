class PagesController < ApplicationController
  def home
  end

  def about
    membersyml = Rails.cache.read('members.yml')
    @members = membersyml['members']
    @alumni = membersyml['alumni']
  end

  def sponsors
  end

  def lets_encrypt
    render text: "64ALMox2G6FPro4F8wtGkYpFkYmKYcE0-p8_NYh9zOk.ipj9LvFKNP4GY2JmEmSgY6tZ4onKbV31c7xsgMXpAq8"
  end
end

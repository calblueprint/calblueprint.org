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
    render text: "CfXBtEB_5pzf8Kd66lTBI6GztNSZ7PYzrIULVagLrlY.7J9hcMdJvtoGXRre2NQKXRPnyf0SIsM90W5TGGdGaRI"
  end
end

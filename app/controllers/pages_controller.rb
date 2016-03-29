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
    render text: "CZHf4LK3c2Sv3Tp5KtMJV0OuFT69iyzIbBOhdSm7rEk.Zqy6AIU0AtwdjrSz-ni768paiJmbRan3wRXqquOaouA"
  end
end

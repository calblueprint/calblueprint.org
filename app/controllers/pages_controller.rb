class PagesController < ApplicationController
  def home
  end

  def about
    membersyml = YAML.load_file('config/locales/en/members.yml')
    @members = membersyml['members']
    @alumni = membersyml['alumni']
  end

  def sponsors
  end

  def lets_encrypt
    render text: "4zimu9T1gQAs2IjSQBxTBC4QP8Gsvui4wfrXnsQ0XlU.7J9hcMdJvtoGXRre2NQKXRPnyf0SIsM90W5TGGdGaRI"
  end
end

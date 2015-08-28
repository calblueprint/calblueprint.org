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
end

class PagesController < ApplicationController
  def home
  end

  def about
    @members = Member.all.sort_by { |member| member.member_role }
  end

  def sponsors
  end
end

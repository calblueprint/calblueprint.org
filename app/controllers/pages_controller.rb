class PagesController < ApplicationController
  def home
  end

  def about
    @members = Member.current.sort_by(&:member_role)
    @alumni = Member.alumni.sort_by(&:member_role)
  end

  def sponsors
  end
end

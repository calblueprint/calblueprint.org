class PagesController < ApplicationController
  def home
  end

  def about
    @members = Member.all
  end

  def sponsors
  end
end

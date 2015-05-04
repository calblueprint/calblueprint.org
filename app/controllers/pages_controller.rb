class PagesController < ApplicationController
  before_action :load_members

  def home
  end

  def about
  end

  def sponsors
  end

  def load_members
    @members = Member.all
  end
end

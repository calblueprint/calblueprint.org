class ApplyController < ApplicationController
  def show
  end

  def students
    @info1date = @settings.infosession_date_one.strftime("%b %e")
    @info1time = @settings.infosession_date_one.strftime("%l:%M %p")
    @info2date = @settings.infosession_date_two.strftime("%b %e")
    @info2time = @settings.infosession_date_two.strftime("%l:%M %p")
  end

  def nonprofits
  end
end

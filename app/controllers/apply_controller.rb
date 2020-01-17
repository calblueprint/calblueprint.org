class ApplyController < ApplicationController
  def show
  end

  def students
    date = "%b %e"
    time = "%l:%M %p"
    if @settings.infosession_one && @settings.infosession_two
      @info1_date = @settings.infosession_one_date.strftime(date)
      @info1_time = @settings.infosession_one_date.strftime(time)
      @info2_date = @settings.infosession_two_date.strftime(date)
      @info2_time = @settings.infosession_two_date.strftime(time)
    elsif @settings.infosession_one
      @info_date = @settings.infosession_one_date.strftime(date)
      @info_time = @settings.infosession_one_date.strftime(time)
      @info_link = @settings.infosession_one_link
    elsif @settings.infosession_two
      @info_date = @settings.infosession_two_date.strftime(date)
      @info_time = @settings.infosession_two_date.strftime(time)
      @info_link = @settings.infosession_two_link
    end
  end

  def nonprofits
  end
end

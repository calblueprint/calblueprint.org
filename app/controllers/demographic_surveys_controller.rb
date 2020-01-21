class DemographicSurveysController < ApplicationController
  before_action :verify_from_app

  def new
    @demographic_survey = DemographicSurvey.new
    # puts URI(request.referrer).path
    # session[:demographic_referrer] = URI(request.referrer).path if request.referrer
  end

  def create
    @demographic_survey = DemographicSurvey.new demographic_survey_params

    # referrer  = session[:demographic_referrer]
    # if referrer == url_for(new_student_application_path)
    #   @demographic_survey.applicant_type = 0
    # elsif referrer == url_for(new_external_application_path)
    #   @demographic_survey.applicant_type = 2
    # end
    @demographic_survey.applicant_type = session[:applicant_type]

    if @demographic_survey.save
      session.delete(:applicant_type)
      redirect_to students_apply_path, flash: { success: t('demographic_surveys.create.success') }
    else
      render "new"
    end
  end
end

private

def verify_from_app
  if session[:applicant_type]
    return
  elsif request.referrer
    referrer = URI(request.referrer).path
    if referrer == url_for(new_student_application_path)
      session[:applicant_type] = 0
      return
    elsif referrer == url_for(new_external_application_path)
      session[:applicant_type] = 2
      return
    end
  end
  redirect_to students_apply_path, flash: { error: t('demographic_surveys.closed') }
end

def demographic_survey_params
  params.require(:demographic_survey).permit(
    :african_american,
    :latino,
    :american_indian,
    :asian,
    :white,
    :sw_asian_n_african,
    :pacific_islander,
    :decline_race,
    :male,
    :female,
    :nonbinary,
    :transgender,
    :intersex,
    :two_spirit,
    :gender_nonconforming,
    :something_else_gender,
    :other_gender,
    :decline_gender
  ).merge(
    semester: @settings.current_semester
  )
end

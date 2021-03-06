class DemographicSurveysController < ApplicationController
  before_action :verify_from_app

  def new
    @demographic_survey = DemographicSurvey.new
  end

  def create
    @demographic_survey = DemographicSurvey.new demographic_survey_params

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
  session[:applicant_type] = 0
  return
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
    :male,
    :female,
    :nonbinary,
    :transgender,
    :intersex,
    :two_spirit,
    :gender_nonconforming,
    :something_else_gender,
    :other_gender,
    :decline_gender,
    :additional_gender_notes,
    :additional_sexual_identity_orientation_notes,
    :asexual,
    :bisexual,
    :gay,
    :lesbian,
    :pansexual,
    :queer,
    :questioning_or_unsure,
    :same_gender_loving,
    :straight,
    :other_sexual_identity_orientation,
    :applicant_type,
    ethnicity_ids: []
  ).merge(
    semester: @settings.current_semester
  )
end

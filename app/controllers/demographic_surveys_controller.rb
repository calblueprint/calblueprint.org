class DemographicSurveysController < ApplicationController

  def new
    verify_from_app
    @demographic_survey = DemographicSurvey.new
  end

  def create
    @demographic_survey = DemographicSurvey.new demographic_survey_params

    if @demographic_survey.save
      redirect_to students_apply_path, flash: { success: t('demographic_surveys.create.success') }
    else
      render "new"
    end
  end
end

private

def verify_from_app
  if request.referrer
    referrer = URI(request.referrer).path
    if referrer == url_for(new_student_application_path)
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
    :decline_sexual_identity_orientation,
    :other_sexual_identity_orientation,
    :applicant_type,
    ethnicity_ids: []
  ).merge(
    semester: @settings.current_semester
  )
end

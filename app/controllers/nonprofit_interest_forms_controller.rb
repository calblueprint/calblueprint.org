require 'google_maps_service'

class NonprofitInterestFormsController < ApplicationController
  before_action :set_nonprofit_interest_form, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_nonprofit
  before_action :set_google_api

  # GET /nonprofit_interest_forms
  def index
    @nonprofit_interest_forms = NonprofitInterestForm.all
  end

  # GET /nonprofit_interest_forms/1
  def show
  end

  # GET /nonprofit_interest_forms/new
  def new
    @nonprofit_interest_form = NonprofitInterestForm.new
  end

  # GET /nonprofit_interest_forms/1/edit
  def edit
  end

  # POST /nonprofit_interest_forms
  def create
    @nonprofit_interest_form = NonprofitInterestForm.new(nonprofit_interest_form_params)
    @nonprofit_interest_form.nonprofit = current_nonprofit
    @nonprofit_interest_form.semester = Settings.instance.current_semester

    # Catch empty office validation errors early
    if !@nonprofit_interest_form.save
      return render :new
    end

    # Attempt to geocode the submission, if the front-end did not
    # if !@nonprofit_interest_form.office_lat
    #   gmaps = GoogleMapsService::Client.new(key: ENV["GOOGLE_MAPS_API"])
    #   results = gmaps.geocode(nonprofit_interest_form_params["office"])
    #   if results.length > 0
    #     print results
    #     coords = results.first[:geometry][:location]
    #     print coords
    #     @nonprofit_interest_form.office_lat = coords[:lat]
    #     @nonprofit_interest_form.office_lng = coords[:lng]
    #   end
    # end

    if @nonprofit_interest_form.save
      redirect_to nonprofit_applications_path, notice: 'Your Interest Form submission was received!'
    else
      render :new
    end
  end

  def authenticate_nonprofit
    redirect_to new_nonprofit_registration_path,
                flash: { alert: "Please sign up or sign in before continuing." } unless current_nonprofit
  end

  def set_google_api
    @google_maps_key = ENV["GOOGLE_MAPS_API"]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nonprofit_interest_form
      @nonprofit_interest_form = NonprofitInterestForm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def nonprofit_interest_form_params
      params.require(:nonprofit_interest_form).permit(:contact_name, :role, :agree_to_terms, :phone, :office, :office_lat, :office_lng, :org_description, :website, :category, :idea, :referrer)
    end
end

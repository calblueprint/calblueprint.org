require 'google_maps_service'

namespace :npo do
  desc "Nonprofit-related tasks to be run by Heroku Scheduler"
  task import: :environment do
    gmaps = GoogleMapsService::Client.new(key: ENV["GOOGLE_MAPS_API"])
    settings = Settings.instance
    semester_str = "#{settings.current_semester.season.capitalize} #{settings.current_semester.year} Applications"

    AirtableNonprofit = Airrecord.table(ENV["AIRTABLE_API"], ENV["AIRTABLE_NPO_TABLE"], semester_str)

    airtable_npos = AirtableNonprofit.all
    db_forms = NonprofitInterestForm.where(semester: settings.current_semester)
    db_apps = NonprofitApplication.where(semester: settings.current_semester, state: "submitted")
    db_npos = db_forms.map { |form| form.nonprofit }
    db_npos_signedup = Nonprofit.where(created_at: settings.current_semester.created_at..Date.today)
    db_npos = (db_npos + db_npos_signedup).uniq

    airtable_npos_emails = airtable_npos.map { |npo| npo[:email] }

    db_npos.each do |npo|
      pos = airtable_npos_emails.index(npo.email)
      if pos.nil?
        airtable_npo = AirtableNonprofit.new({
          "Nonprofit Name": npo.organization_name,
          "Email": npo.email,
          "Application Phase": "Signed up"
        })
        airtable_npo.create
      else
        airtable_npo = airtable_npos[pos]
      end

      form = db_forms.where(nonprofit: npo).first
      if !form.nil? && airtable_npo["Phone Number"].nil?
        airtable_npo["Phone Number"] = form.phone
        airtable_npo["Contact Name"] = form.contact_name
        airtable_npo["Contact Role"] = form.role
        airtable_npo["Website"] = form.website

        if NonprofitInterestForm::CATEGORIES.index(form.category).nil?
          airtable_npo["Service"] = "Other"
          airtable_npo["Service (if other)"] = form.category
        else
          airtable_npo["Service"] = form.category
        end

        airtable_npo["Description"] = form.org_description
        airtable_npo["Referrer"] = form.referrer

        if form.office_lat
          coords = [form.office_lat, form.office_lng]
          reversed_results = gmaps.reverse_geocode(coords)

          if reversed_results.length > 0
            airtable_npo["Address"] = reversed_results.first[:formatted_address]
          end
        end

        airtable_npo["Application Phase"] = "Completed Phase 1"
        airtable_npo.save
      end

      app = db_apps.where(nonprofit: npo).first
      if !app.nil? && airtable_npo["Founded"].nil?
        airtable_npo["Mission Statement"] = app.purpose
        airtable_npo["History and Accomplishments"] = app.history
        airtable_npo["Founded"] = app.date_established
        airtable_npo["Project Summary"] = app.short_summary
        airtable_npo["Project Goals"] = app.goals
        airtable_npo["Project Key Features"] = app.key_features
        airtable_npo["Project Target Devices"] = app.devices.select { |d| d != "" }
        airtable_npo["Project Target Audience"] = app.target_audience
        airtable_npo["Project Importance"] = app.why
        airtable_npo["Project Technical Requirements"] = app.technical_requirements
        airtable_npo["Application Phase"] = "Completed Phase 2"
        airtable_npo.save
      end
    end
  end

end

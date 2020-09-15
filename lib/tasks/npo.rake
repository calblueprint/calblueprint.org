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
        # NPO filled out phase 1, but hasn't been updated in Airtable yet
        airtable_npo["Phone Number"] = form.phone.phony_formatted!
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
      if !app.nil? && airtable_npo["Project Summary"].nil?
        # App was completed, but phase 2 hasn't been updated in Airtable yet
        airtable_npo["Project Summary"] = app.short_summary
        airtable_npo["Project Current Resources"] = app.current_resources
        airtable_npo["Project Key Features"] = app.key_features
        airtable_npo["Project Goals and Audience"] = app.goals
        airtable_npo["Project Future Plans"] = app.future_plans
        airtable_npo["NPO Inclusivity"] = app.inclusivity
        airtable_npo["Unlocked Phase 2"] = true

        airtable_npo["Application Phase"] = "Completed Phase 2"
        airtable_npo.save
      end
    end
  end

end

namespace :external do
  desc "External application-related tasks to be run by Heroku Scheduler"
  task sync: :environment do
    settings = Settings.instance
    semester_str = "#{settings.current_semester.season.capitalize} #{settings.current_semester.year}"
    AirtableApp = Airrecord.table(ENV["AIRTABLE_API"], ENV["AIRTABLE_EXTERNAL_TABLE"], semester_str)

    air_apps = AirtableApp.all
    db_apps = ExternalApplication.where(semester: settings.current_semester)

    air_emails = air_apps.map { |app| app[:email] }

    db_apps.each do |app|
      positions = []
      if app.operations
        positions.push("Operations")
      end
      if app.content
        positions.push("Content")
      end
      if app.outreach
        positions.push("Outreach")
      end
      app_params = {
        "Name": app.name,
        "Email": app.email,
        "Phone Number": app.phone,
        "Year": app.year,
        "Major": app.major,
        "Applied before?": app.applied_before,
        "Positions applying for": positions,
        "Additional position": app.additional_option,
        "Social links": app.social_links,
        "Personal growth": app.personal_growth,
        "Identity/Why Join": app.why_join,
        "Time commitments": app.commitments
      }

      if app.resume.exists?
        app_params["Resume"] = [{ url: app.resume.url }]
      end

      pos = air_emails.index(app.email)
      if pos.nil?
        air_app = AirtableApp.new(app_params)
        air_app.create
      else
        air_app = air_apps[pos]
        app_params.each do |key, val|
          air_app[key] = val
        end
      end
      air_app.save
      sleep 0.5
    end
  end

end

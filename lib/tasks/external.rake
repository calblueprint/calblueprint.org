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
      app_params = {
        "Name": app.name,
        "Email": app.email,
        "Phone Number": app.phone,
        "Year": app.year,
        "Major": app.major,
        "Applied before?": app.applied_before,
        "Social links": app.social_links,
        "Contribute to Design": app.why_join,
        "Time commitments": app.commitments
      }

      if app.resume.exists?
        app_params["Resume"] = [app.resume.url]
      end

      if app.design_portfolio.exists?
        app_params["Design Portfolio"] = [app.design_portfolio.url]
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

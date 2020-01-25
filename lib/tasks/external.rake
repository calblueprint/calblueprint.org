namespace :external do
  desc "External application-related tasks to be run by Heroku Scheduler"
  task sync: :environment do
    settings = Settings.instance
    semester_str = "#{settings.current_semester.season.capitalize} #{settings.current_semester.year}"
    AirtableApp = Airrecord.table(ENV["AIRTABLE_API"], ENV["AIRTABLE_EXTERNAL_TABLE"], semester_str + " Applications")

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
        "Positions Applying For": [
          app.operations? ? 'Operations' : nil,
          app.content? ? 'Content' : nil,
          app.design? ? 'Marketing' : nil
        ].compact,
        "Applied before?": app.applied_before,
        "Passionate Cause": app.why_join,
        "Project Experience": app.experience,
        "Personal Growth": app.personal_growth,
        "Social links": app.social_links,
        "Time commitments": app.commitments
      }

      if app.resume.exists?
        app_params["Resume"] = [{url: "https:" + app.resume.url}]
      end

      if app.design_portfolio.exists?
        app_params["Design Portfolio File"] = [{url: 'https:' + app.design_portfolio.url}]
      end

      if app.design_portfolio_link.present?
        app_params["Design Portfolio Link"] = app.design_portfolio_link
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

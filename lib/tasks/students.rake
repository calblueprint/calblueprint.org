namespace :students do
  desc "Student application-related tasks to be run by Heroku Scheduler"
  task sync: :environment do
    settings = Settings.instance
    semester_str = "#{settings.current_semester.season.capitalize} #{settings.current_semester.year}"
    AirtableApp = Airrecord.table(ENV["AIRTABLE_API"], ENV["AIRTABLE_STUDENTS_TABLE"], semester_str)

    air_apps = AirtableApp.all
    db_apps = StudentApplication.where(semester: settings.current_semester)

    air_emails = air_apps.map { |app| app[:email] }

    db_apps.each do |app|
      app_params = {
        "Name": app.name,
        "Email": app.email,
        "Phone Number": app.phone,
        "Year": app.year,
        "Applied before?": app.applied_before,
        "Heard about Blueprint from": app.heard_from,
        "Can attend BP Games?": app.available_for_bp_games,
        "Can attend retreat?": app.available_for_retreat,
        "Why no retreat?": app.why_no_retreat,
        "Why no BP Games?": app.why_no_bp_games,
        "Time commitments": app.commitments,
        "Identity/Why Join": app.why_join,
        "Hardest Achievement": app.hardest_achievement,
        "Past work experience/Extracurriculars": app.experience,
        "Personal Projects": app.projects,
        "Service Experience": app.service,
        "Wins": app.wins_count,
        "Losses": app.losses_count
      }

      if !app.resume.nil?
        app_params["Resume"] = [{ url: app.resume.url }]
      end
      if !app.design_portfolio.nil?
        app_params["Design Portfolio"] = [{ url: app.design_portfolio.url }]
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

namespace :students do
  desc "Student application-related tasks to be run by Heroku Scheduler"
  task sync: :environment do
    settings = Settings.instance
    semester_str = "#{settings.current_semester.season.capitalize} #{settings.current_semester.year}"
    AirtableApp = Airrecord.table(ENV["AIRTABLE_API"], ENV["AIRTABLE_STUDENTS_TABLE"], semester_str + " Applications")

    air_apps = AirtableApp.all
    db_apps = StudentApplication.where(semester: settings.current_semester)

    air_emails = air_apps.map { |app| app[:email] }

    # options: application_type_dev_des_ex, application_type
    application_roles = "application_type"
    
    db_apps.each do |app|
      app_params = {
        "App ID": app.id,
        "Name": app.response_to("name"),
        "Pronouns": app.response_to("pronouns"),
        "Email": app.response_to("email"),
        "Phone Number": app.response_to("phone"),
        "Year": app.response_to("year"),
        "Major": app.response_to("major"),
        "Applied before?": app.response_to("applied_before") == "Yes" ? "Yes" : "No",
        "Semesters applied": app.response_to("semesters_applied_before").present? ? app.response_to("semesters_applied_before") : "n/a",
        "Application type": app.response_to(application_roles),
        "[Designer Only] Background": "", #app.response_to("sp22_designer_question"),
        "[External Only] Role": "Designer", #app.response_to("sp22_external_role_question"),
        "[External Only] Background": "", #app.response_to("sp22_external_experience_question"),

        "Time Commitment Acknowledgement": app.response_to("time_commitment_acknowledgement") && "Yes",
        
        "Mission First": "", #app.response_to("sp22_mission_first"),
        "Perpetual Growth": "", #app.response_to("sp22_perpetual_growth"),
        "Always Innovate": "", #app.response_to("sp22_always_innovate"),

        "Optional Background Question": "", #app.response_to("background_question"),
        "Project Link": "", #app.response_to("sp21_project_link"),

        "Heard about Blueprint from": "", #app.response_to("heard_from"),
        "Survey Notice": app.response_to("survey_notice"),
      }

      # ComparisonCategory.where(semester: settings.current_semester).each do |category|
      #   puts "Finding apps with category #{category}"
      #   app_params[category.name + " Wins"] = Comparison.where(comparison_category: category, winner_id: app.id).count
      #   app_params[category.name + " Losses"] = Comparison.where(comparison_category: category, loser_id: app.id).count
      # end

      # resume = app.file_for("resume")
      # # design_portfolio = app.file_for("design_portfolio")
      # if resume.exists?
      #   app_params["Resume"] = [{url: "https:" + resume.url}]
      # end
      # if design_portfolio.exists?
      #   app_params["Design Portfolio"] = [{url: "https:" + design_portfolio.url}]
      # end

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

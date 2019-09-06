namespace :students do
  desc "Student application-related tasks to be run by Heroku Scheduler"
  task sync: :environment do
    settings = Settings.instance
    semester_str = "#{settings.current_semester.season.capitalize} #{settings.current_semester.year}"
    AirtableApp = Airrecord.table(ENV["AIRTABLE_API"], ENV["AIRTABLE_STUDENTS_TABLE"], semester_str + " Applications")

    air_apps = AirtableApp.all
    db_apps = StudentApplication.where(semester: settings.current_semester)

    air_emails = air_apps.map { |app| app[:email] }

    db_apps.each do |app|
      app_params = {
        "Name": app.response_to("name"),
        "Email": app.response_to("email"),
        "Phone Number": app.response_to("phone"),
        "Year": app.response_to("year"),
        "Applied before?": app.response_to("applied_before") == "Yes",
        "Time commitments": app.response_to("commitments"),
        "Application type": app.response_to("application_type"),
        "Can attend BP Games?": app.response_to("available_for_bp_games") == "Yes",
        "Why no BP Games?": app.response_to("why_no_bp_games"),
        "Can attend retreat?": app.response_to("available_for_retreat") == "yes",
        "Why no retreat?": app.response_to("why_no_retreat"),
        "Passionate cause": app.response_to("mission_first"),
        "Built/learned from scratch": app.response_to("always_innovate"),
        "Personal growth": app.response_to("be_humble"),
        "Heard about Blueprint from": app.response_to("heard_from"),
        "Add to newsletter?": app.response_to("add_to_newsletter") == "Yes"
      }

      # ComparisonCategory.all.each do |category|
      #   puts "Finding apps with category #{category}"
      #   app_params[category.name + " Wins"] = Comparison.where(comparison_category: category, winner_id: app.id).count
      #   app_params[category.name + " Losses"] = Comparison.where(comparison_category: category, loser_id: app.id).count
      # end

      resume = app.file_for("resume")
      design_portfolio = app.file_for("design_portfolio")
      if resume.exists?
        app_params["Resume"] = [{url: "https:" + resume.url}]
      end
      if design_portfolio.exists?
        app_params["Design Portfolio"] = [{url: "https:" + design_portfolio.url}]
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

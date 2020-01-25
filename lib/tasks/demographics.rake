genders = ['Male', 'Female', 'Nonbinary', 'Transgender', 'Intersex', 'Two Spirit', 'Gender Nonconforming'].freeze
namespace :demographics do
  desc "Demographic survey-related tasks to be run by Heroku Scheduler"
  task sync: :environment do
    settings = Settings.instance
    semester_str = "#{settings.current_semester.season.capitalize} #{settings.current_semester.year}"
    AirtableApp = Airrecord.table(ENV["AIRTABLE_API"], ENV["AIRTABLE_DEMOGRAPHICS_TABLE"], semester_str + " Surveys")

    air_apps = AirtableApp.all
    db_apps = DemographicSurvey.where(semester: settings.current_semester)

    air_ids = air_apps.map { |app| app[:id] }

    db_apps.each do |app|
      race_group = []
      races = []
      app.ethnicities.each do |race|
        race_group << race.group
        races << race.name
      end

      app_params = {
        "Race / Ethnicity Group": race_group.uniq,
        "Race / Ethnicity": races,
        "Gender": genders.select { |gender| app[gender.parameterize(separator: '_').to_sym] }
      }

      if app.other_gender.present?
        app_params["Gender Personal"] = app.other_gender
      end

      pos = air_ids.index(app.id)
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

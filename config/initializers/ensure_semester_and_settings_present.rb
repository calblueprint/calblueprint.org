# Makes sure at least one semester and one settings model is in the system
# before the app starts.
# TODO: This should not run on setup
class EnsureSemesterAndSettingsPresent
  class << self
    def execute
      create_first_semester if should_create? Semester
      create_first_settings if should_create? Settings
    end

    private

    def create_first_semester
      today = Date.today
      year = today.year
      season = today.month < 6 ? :spring : :fall
      Semester.create year: year, season: season
    end

    def create_first_settings
      Settings.create npo_app_open: true,
                      student_app_open: true,
                      current_semester_id: Semester.first.id,
                      singleton_guard: 0
    end

    def should_create?(klass)
      table_name = klass.to_s.tableize
      ActiveRecord::Base.connection.table_exists?(table_name) && !klass.any?
    end
  end
end

EnsureSemesterAndSettingsPresent.execute

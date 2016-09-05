class StudentAppsCsv
  class << self
    COLUMN_NAMES = %w(name email appliction_year wins losses class applied_before bp_games retreat)

    def to_csv(student_applications)
      CSV.generate do |csv|
        csv << COLUMN_NAMES
        student_applications.each do |app|
          csv << [app.applicant.name, app.email, "#{app.semester.season} #{app.semester.year}",
                  app.wins_count, app.losses_count, app.year, app.applied_before, app.available_for_bp_games,
                  app.available_for_retreat]
        end
      end
    end

    private

    def open_spreadsheet(file)
      case File.extname(file.original_filename)
      when ".csv" then Roo::Spreadsheet.open(file.path, extension: :csv)
      # TODO: fail more gracefully
      else fail "Unknown file type: #{file.original_filename}"
      end
    end
  end
end

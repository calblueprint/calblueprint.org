class StudentAppsCsv
  class << self
    COLUMN_NAMES = %w(created_at final_decision_id name email decision)

    def to_csv(student_applications)
      CSV.generate do |csv|
        csv << COLUMN_NAMES
        student_applications.order("created_at desc").each do |app|
          csv << [app.created_at, app.final_decision.id, app.applicant.name,
                  app.email, app.final_decision.decision]
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

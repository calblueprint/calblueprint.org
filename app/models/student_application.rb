# == Schema Information
#
# Table name: student_applications
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  applicant_id :integer
#  semester_id  :integer
#  why_join     :text
#

class StudentApplication < ActiveRecord::Base
  include AssignToCurrentSemester

  belongs_to :applicant
  belongs_to :semester

  has_one :final_decision, as: :decisionable

  validates :applicant_id, presence: true
  validates :semester_id, presence: true

  after_create :create_final_decision

  validates :why_join, presence: true

  def self.to_csv(options = {})
    headers = %w(final_decision_id name email admitted)
    CSV.generate(options) do |csv|
      csv << headers
      all.each do |app|
        csv << [app.final_decision.id, app.applicant.name, app.applicant.email, app.final_decision.admitted]
      end
    end
  end

  def self.import_decision(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2...spreadsheet.last_row + 1).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      decision = find_by_id(row["final_decision_id"])
      decision.final_decision.update_attribute(:admitted, row["admitted"])
      decision.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Spreadsheet.open(file.path, extension: :csv)
      # when ".xls" then Roo::Excel.open(file.path)
      # when ".xlsx" then Roo::Excel.open(file.path)
    else fail "Unknown file type: #{file.original_filename}"
    end
  end
end

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

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      StudentApplication.create! row.to_hash
    end
  end
end

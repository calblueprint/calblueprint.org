# == Schema Information
#
# Table name: settings
#
#  id                   :integer          not null, primary key
#  created_at           :datetime
#  updated_at           :datetime
#  singleton_guard      :integer
#  current_semester_id  :integer
#  npo_app_open         :boolean
#  student_app_open     :boolean
#  cs169_app_open       :boolean
#  comparison_bonus     :integer          default(0)
#  comparison_penalty   :integer          default(0)
#  comparison_threshold :integer          default(0)
#  applicants_remaining :integer          default(0)
#  external_app_open    :boolean          default(TRUE)
#

class Settings < ActiveRecord::Base
  validates :singleton_guard, numericality: 0
  validates :npo_app_open, inclusion: [true, false]
  validates :npo_statement_of_interest_open, inclusion: [true, false]
  validates :npo_project_proposal_open, inclusion: [true, false]
  validates :cs169_app_open, inclusion: [true, false]
  validates :student_app_open, inclusion: [true, false]
  validates :current_semester_id, presence: true

  def self.instance
    first_or_create npo_app_open: true,
                    cs169_app_open: true,
                    student_app_open: true,
                    current_semester_id: Semester.first_or_create(season: :spring, year: '2013').id,
                    singleton_guard: 0
  end

  def current_semester
    Semester.find(current_semester_id)
  rescue ActiveRecord::RecordNotFound
    throw "Current semester ID invalid!"
  end
end

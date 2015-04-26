# == Schema Information
#
# Table name: settings
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  singleton_guard     :integer
#  current_semester_id :integer
#  npo_app_open        :boolean
#  student_app_open    :boolean
#

class Settings < ActiveRecord::Base
  validates_numericality_of :singleton_guard, equal: 0
  validates :npo_app_open, inclusion: [true, false]
  validates :student_app_open, inclusion: [true, false]
  validates :current_semester_id, presence: true

  def self.instance
    Settings.first_or_create npo_app_open: true,
                             student_app_open: true,
                             current_semester_id: Semester.first.id
  end

  def current_semester
    Semester.find(current_semester_id)
  rescue ActiveRecord::RecordNotFound
    throw "Current semester ID invalid!"
  end
end

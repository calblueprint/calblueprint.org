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
  validates :npo_app_open, inclusion: { in: [true, false] }
  validates :student_app_open, inclusion: { in: [true, false] }
  validates :current_semester_id, presence: true

  # source: http://stackoverflow.com/questions/399447/how-to-implement-a-singleton-model
  def self.instance
    # there will be only one row, and its ID must be '1'
    begin
      find(1)
    rescue ActiveRecord::RecordNotFound
      # slight race condition here, but it will only happen once
      row = Settings.new npo_app_open: false, student_app_open:false, current_semester_id: nil
      row.singleton_guard = 0
      row.save
      row
    end
  end

  def current_semester
    begin
      Semester.find(current_semester_id)
    rescue ActiveRecord::RecordNotFound
    end
  end
end

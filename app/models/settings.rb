class Settings < ActiveRecord::Base
  validates_numericality_of :singleton_guard, equal: 0
  validates :npo_status, presence: true
  validates :student_status, presence: true
  validates :current_semester_id, presence: true

  # source: http://stackoverflow.com/questions/399447/how-to-implement-a-singleton-model
  def self.instance
    # there will be only one row, and its ID must be '1'
    begin
      first
    rescue ActiveRecord::RecordNotFound
      # slight race condition here, but it will only happen once
      row = Settings.new
      row.singleton_guard = 0
      row.save!
      row
    end
  end
end

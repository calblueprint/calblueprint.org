# == Schema Information
#
# Table name: comparisons
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  winner_id  :integer          not null
#  loser_id   :integer          not null
#  admin_id   :integer          not null
#

class Comparison < ActiveRecord::Base
  belongs_to :winner, class_name: StudentApplication, counter_cache: :wins_count
  belongs_to :loser, class_name: StudentApplication, counter_cache: :losses_count
  belongs_to :admin

  validates :winner_id, presence: true
  validates :loser_id, presence: true
  validates :admin_id, presence: true

  validate :check_winner_and_loser

  def self.current
      Comparison.joins('LEFT OUTER JOIN "student_applications" ON
                        "comparisons"."winner_id" = "student_applications"."id"').where(
                        '"student_applications"."semester_id" = ?',
                        Settings.instance.current_semester_id)
  end

  def check_winner_and_loser
    errors.add(:winner_id, "cannot be same as loser") if winner_id == loser_id
  end

end

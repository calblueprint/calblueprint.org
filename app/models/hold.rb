# == Schema Information
#
# Table name: holds
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  left_id    :integer          not null
#  right_id   :integer          not null
#  admin_id   :integer          not null
#

class Hold < ActiveRecord::Base
  belongs_to :left, class_name: StudentApplication
  belongs_to :right, class_name: StudentApplication
  belongs_to :admin

  validates :left_id, presence: true
  validates :right_id, presence: true
  validates :admin_id, presence: true

  validate :check_left_and_right
  validate :unique_application
  validate :single_current_hold

  scope :current, -> { where('updated_at > ?', 15.minutes.ago) }

  private

  def check_left_and_right
    errors.add(:left_id, "cannot be same as right") if self.left_id == self.right_id
  end

  def unique_application
    errors.add(:left_id, "application must be unique") if Hold.current.where('left_id = ? OR right_id = ?', self.left_id, self.left_id).any?
    errors.add(:right_id, "application must be unique") if Hold.current.where('left_id = ? OR right_id = ?', self.right_id, self.right_id).any?
  end

  def single_current_hold
    errors.add(:admin_id, "Cannot have multiple current holds") if Hold.current.find_by_admin_id self.admin_id
  end
end

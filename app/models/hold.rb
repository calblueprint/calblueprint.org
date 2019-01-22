# == Schema Information
#
# Table name: holds
#
#  id            :integer          not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  left_id       :integer          not null
#  right_id      :integer          not null
#  admin_id      :integer          not null
#  current_until :datetime
#

class Hold < ActiveRecord::Base
  belongs_to :left, class_name: "StudentApplication"
  belongs_to :right, class_name: "StudentApplication"
  belongs_to :admin
  belongs_to :comparison_category

  validates :left_id, presence: true
  validates :right_id, presence: true
  validates :admin_id, presence: true
  validates :comparison_category_id, presence: true

  validate :check_left_and_right
  validate :unique_application
  validate :single_current_hold

  after_initialize :set_current_until

  scope :current, -> { where('current_until > ?', Time.now) }

  def renew(new_time = 15.minutes.from_now)
    self.update_attributes(current_until: new_time)
  end

  def release
    self.update_attributes(current_until: 1.second.ago)
  end

  def current?
    self.current_until > Time.now
  end

  def self.current_hold(id)
    hold = Hold.current.where('left_id = ? OR right_id = ?', id, id)
    hold.any? ? hold.first : false
  end

  def self.find_hold(admin_id, app_1_id, app_2_id)
    hold = Hold.current.where(admin_id: admin_id)
               .where('left_id = ? OR right_id = ?', app_1_id, app_1_id)
               .where('left_id = ? OR right_id = ?', app_2_id, app_2_id)

    hold.any? ? hold.first : false
  end

  private

  def set_current_until
    self.current_until ||= 15.minutes.from_now
  end

  def check_left_and_right
    errors.add(:left_id, "cannot be same as right") if self.left_id == self.right_id
  end

  def unique_application
    errors.add(:left_id, "application must be unique") if Hold.current.where.not(id: self.id).where('left_id = ? OR right_id = ?', self.left_id, self.left_id).any?
    errors.add(:right_id, "application must be unique") if Hold.current.where.not(id: self.id).where('left_id = ? OR right_id = ?', self.right_id, self.right_id).any?
  end

  def single_current_hold
    errors.add(:admin_id, "Cannot have multiple current holds") if Hold.current.where.not(id: self.id).where('admin_id = ?', self.admin_id).any?
  end
end

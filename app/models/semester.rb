# == Schema Information
#
# Table name: semesters
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  season              :string(255)
#  year                :string(255)
#  is_current_semester :boolean          default(FALSE)
#

class Semester < ActiveRecord::Base
  extend Enumerize
  enumerize :season, in: [:fall, :spring]

  has_many :student_applications
  has_many :projects

  validates :year, uniqueness: { scope: [:season] }, presence: true

  def can_be_destroyed?
    ! (student_applications.exists? || projects.exists?)
  end

  def self.current_semester
    where(is_current_semester: true).first
  end

  def self.clear_current_semester
    update_all(is_current_semester: false)
  end
end

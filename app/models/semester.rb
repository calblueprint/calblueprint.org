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

  has_many :apps
  has_many :projects

  validates :year, uniqueness: { scope: [:season] }, presence: true

  def can_be_destroyed?
    apps.exists? || projects.exists?
  end

  def clear_current_semester
    Semester.where('is_current_semester').update_all("is_current_semester = 'false'")
  end
end

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

  has_many :apps
  has_many :projects

  enumerize :season, in: [:fall, :spring]
  validates :year, presence: true
  validates_uniqueness_of :is_current_semester, if: :is_current_semester
end

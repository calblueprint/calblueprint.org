# == Schema Information
#
# Table name: semesters
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  season     :string(255)
#  year       :string(255)
#

class Semester < ActiveRecord::Base
  extend Enumerize
  enumerize :season, in: [:fall, :spring]

  has_many :student_applications
  has_many :nonprofit_applications
  has_many :external_applications
  has_many :question_semesters
  has_many :questions, through: :question_semesters
  has_many :comparison_categories

  validates :year, uniqueness: { scope: [:season], case_sensitive: false }, presence: true

  def can_be_destroyed?
    student_applications.none? && Semester.count > 1
  end

  def to_s
    "#{season} #{year}"
  end
end

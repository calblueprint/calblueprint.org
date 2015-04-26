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
  has_many :projects

  validates :year, uniqueness: { scope: [:season] }, presence: true

  def can_be_destroyed?
    ! (student_applications.exists? || projects.exists?)
  end

  def to_s
    "#{season} #{year}"
  end
end

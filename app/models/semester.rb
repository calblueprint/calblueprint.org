class Semester < ActiveRecord::Base
  has_many :apps
  has_many :projects

  enum seasons: [:fall, :spring]
  validates :season, presence: true, inclusion: { in: Semester.seasons.keys }
  validates :year, presence: true
end

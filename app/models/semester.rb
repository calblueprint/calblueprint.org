class Semester < ActiveRecord::Base
  extend Enumerize

  has_many :apps
  has_many :projects

  enumerize :season, in: [:fall, :spring]
  validates :year, presence: true
end

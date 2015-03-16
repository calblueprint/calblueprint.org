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

  has_many :apps
  has_many :projects

  enumerize :season, in: [:fall, :spring]
  # TODO: Need to make sure all years are the same between apps and semesters
  #       Probably remove year from apps
  validates :year, presence: true
end

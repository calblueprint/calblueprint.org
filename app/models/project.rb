# == Schema Information
#
# Table name: projects
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  short_summary :string(255)
#  overview      :string(255)
#  problem       :string(255)
#  solution      :string(255)
#  link          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  semester_id   :integer
#

class Project < ActiveRecord::Base
  include AssignToCurrentSemester

  belongs_to :semester

  validates :semester_id, presence: true
end

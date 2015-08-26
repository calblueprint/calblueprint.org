# == Schema Information
#
# Table name: projects
#
#  id            :integer          not null, primary key
#  title         :string
#  short_summary :string
#  overview      :string
#  problem       :string
#  solution      :string
#  link          :string
#  created_at    :datetime
#  updated_at    :datetime
#  semester_id   :integer
#

class Project < ActiveRecord::Base
  belongs_to :semester

  validates :semester_id, presence: true
end

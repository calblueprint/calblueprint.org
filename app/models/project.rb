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
#

class Project < ActiveRecord::Base
  belongs_to :semester
end

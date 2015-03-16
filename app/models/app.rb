# == Schema Information
#
# Table name: apps
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  year         :string(255)
#  applicant_id :integer
#

class App < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :semester

  validates :applicant_id, presence: true
  validates :semester_id, presence: true
end

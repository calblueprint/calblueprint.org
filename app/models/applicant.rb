# == Schema Information
#
# Table name: applicants
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

class Applicant < ActiveRecord::Base
  validates :name, presence: true
end

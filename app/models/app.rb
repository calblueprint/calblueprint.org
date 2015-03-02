# == Schema Information
#
# Table name: apps
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  last_name    :string(255)
#  first_name   :string(255)
#  email        :string(255)
#  year         :string(255)
#  applicant_id :integer
#

class App < ActiveRecord::Base
  belongs_to :applicant

  validates :year, presence: true
end

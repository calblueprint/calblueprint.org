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

FactoryGirl.define do
  factory :app do
    year "2017"
    applicant
  end
end

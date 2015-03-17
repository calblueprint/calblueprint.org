# == Schema Information
#
# Table name: apps
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  applicant_id :integer
#  semester_id  :integer
#

FactoryGirl.define do
  factory :app do
    applicant
    semester
  end
end

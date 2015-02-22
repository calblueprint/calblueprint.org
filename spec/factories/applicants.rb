# == Schema Information
#
# Table name: applicants
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

FactoryGirl.define do
  factory :applicant do
    sequence(:name) { |n| "Applicant #{n}" }
  end
end

# == Schema Information
#
# Table name: applicants
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  name                :string
#  email               :string           default(""), not null
#  remember_created_at :datetime
#

FactoryGirl.define do
  factory :applicant do
    sequence(:name) { |n| "Applicant #{n}" }
    sequence(:email) { |n| "application#{n}@gmail.com" }
  end
end

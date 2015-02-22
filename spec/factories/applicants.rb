# == Schema Information
#
# Table name: applicants
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  name                :string(255)
#  email               :string(255)      default(""), not null
#  encrypted_password  :string(255)      default(""), not null
#  remember_created_at :datetime
#

FactoryGirl.define do
  factory :applicant do
    sequence(:name) { |n| "Applicant #{n}" }
    sequence(:email) { |n| "application#{n}@gmail.com" }
    password "password"
  end
end

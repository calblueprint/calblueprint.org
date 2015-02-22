# == Schema Information
#
# Table name: identities
#
#  id           :integer          not null, primary key
#  applicant_id :integer
#  provider     :string(255)
#  uid          :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

FactoryGirl.define do
  factory :identity do
    applicant
    provider "provider"
    sequence(:uid) { |n| "#{n}" }
  end
end

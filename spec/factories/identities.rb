# == Schema Information
#
# Table name: identities
#
#  id           :integer          not null, primary key
#  applicant_id :integer
#  provider     :string
#  uid          :string
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

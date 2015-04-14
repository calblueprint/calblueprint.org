# == Schema Information
#
# Table name: members
#
#  id             :integer          not null, primary key
#  created_at     :datetime
#  updated_at     :datetime
#  last_name      :string(255)
#  first_name     :string(255)
#  email          :string(255)
#  member_role_id :integer
#

FactoryGirl.define do
  factory :member do
    sequence(:last_name) { |n| "#{n}" }
    sequence(:email) { |n| "member#{n}@gmail.com" }
    first_name "Member"
  end
end

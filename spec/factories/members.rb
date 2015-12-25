# == Schema Information
#
# Table name: members
#
#  id             :integer          not null, primary key
#  created_at     :datetime
#  updated_at     :datetime
#  last_name      :string
#  first_name     :string
#  email          :string
#  member_role_id :integer
#  is_alumnus     :boolean          default(FALSE)
#

FactoryGirl.define do
  factory :member do
    sequence(:last_name) { |n| "#{n}" }
    sequence(:email) { |n| "member#{n}@gmail.com" }
    first_name "Member"
    member_role
  end
end

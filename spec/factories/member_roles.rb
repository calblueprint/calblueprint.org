# == Schema Information
#
# Table name: member_roles
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  role       :string
#

FactoryGirl.define do
  factory :member_role do
    sequence(:role) { |n| "Factory Role #{n}" }
  end
end

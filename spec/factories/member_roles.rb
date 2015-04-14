# == Schema Information
#
# Table name: member_roles
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  role       :string(255)
#

FactoryGirl.define do
  factory :member_role do
    role "Factory Role"
  end
end

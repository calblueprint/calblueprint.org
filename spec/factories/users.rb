# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  first_name :string(255)
#  last_name  :string(255)
#

FactoryGirl.define do
  factory :user do

  end

end

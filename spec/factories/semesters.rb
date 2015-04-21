# == Schema Information
#
# Table name: semesters
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  season     :string(255)
#  year       :string(255)
#

FactoryGirl.define do
  factory :semester do
    season "spring"
    sequence(:year) { |n| "#{n}" }
  end
end

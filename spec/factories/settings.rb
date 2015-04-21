# == Schema Information
#
# Table name: settings
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  npo_status          :string(255)
#  student_status      :string(255)
#  singleton_guard     :integer
#  current_semester_id :integer
#

FactoryGirl.define do
  factory :settings do
    npo_status "open"
    student_status "open"
    current_semester_id 1
    singleton_guard 0
  end
end

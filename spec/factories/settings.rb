# == Schema Information
#
# Table name: settings
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  singleton_guard     :integer
#  current_semester_id :integer
#  npo_app_open        :boolean
#  student_app_open    :boolean
#

FactoryGirl.define do
  factory :settings do
    npo_app_open true
    student_app_open true
    cs169_app_open true
    current_semester_id 1
    singleton_guard 0
  end
end

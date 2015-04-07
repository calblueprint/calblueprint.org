# == Schema Information
#
# Table name: student_applications
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  applicant_id :integer
#  semester_id  :integer
#

FactoryGirl.define do
  factory :student_application do
    applicant
    semester
  end
end

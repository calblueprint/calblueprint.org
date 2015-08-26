# == Schema Information
#
# Table name: student_applications
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  applicant_id           :integer
#  semester_id            :integer
#  why_join               :text
#  resume_file_name       :string
#  resume_content_type    :string
#  resume_file_size       :integer
#  resume_updated_at      :datetime
#  year                   :string
#  phone                  :string
#  name                   :string
#  email                  :string
#  available_for_bp_games :boolean          default(FALSE)
#  available_for_retreat  :boolean          default(FALSE)
#

FactoryGirl.define do
  factory :student_application do
    applicant
    semester
    name { applicant.name }
    email { applicant.email }
    why_join "I love Blueprint"
    phone "012-345-5678"
    year "Freshman"
    resume_file_name { 'test.pdf' }
    resume_content_type { 'application/pdf' }
    resume_file_size 800
  end
end

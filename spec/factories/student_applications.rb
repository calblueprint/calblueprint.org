# == Schema Information
#
# Table name: student_applications
#
#  id                            :integer          not null, primary key
#  created_at                    :datetime
#  updated_at                    :datetime
#  applicant_id                  :integer
#  semester_id                   :integer
#  why_join                      :text
#  resume_file_name              :string
#  resume_content_type           :string
#  resume_file_size              :integer
#  resume_updated_at             :datetime
#  year                          :string
#  phone                         :string
#  name                          :string
#  email                         :string
#  available_for_bp_games        :boolean          default(FALSE)
#  available_for_retreat         :boolean          default(FALSE)
#  wins_count                    :integer          default(0)
#  losses_count                  :integer          default(0)
#  experience                    :text
#  projects                      :text
#  service                       :text
#  why_no_bp_games               :text
#  why_no_retreat                :text
#  applied_before                :boolean          default(FALSE)
#  version                       :integer          default(2)
#  design_portfolio_file_name    :string
#  design_portfolio_content_type :string
#  design_portfolio_file_size    :integer
#  design_portfolio_updated_at   :datetime
#  add_to_newsletter             :boolean          default(TRUE)
#

FactoryGirl.define do
  factory :student_application do
    applicant
    semester
    name { applicant.name }
    email { applicant.email }
    why_join FFaker::Lorem.paragraph
    phone FFaker::PhoneNumber.phone_number
    year ['Freshman', 'Sophomore', 'Junior', 'Senior'].sample
    resume_file_name { 'test.pdf' }
    resume_content_type { 'application/pdf' }
    resume_file_size 800
    version 1

    trait :v2 do
      version 2
      experience FFaker::Lorem.paragraph
      projects FFaker::Lorem.paragraph
      service FFaker::Lorem.paragraph
      available_for_bp_games true
      available_for_retreat true
    end

    trait :current do
      semester { Settings.instance.current_semester }
    end

    trait :old do
      semester {
        if Semester.count == 0
          create(:semester)
        end
        create(:semester)
      }
    end
  end
end

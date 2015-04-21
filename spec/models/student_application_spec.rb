# == Schema Information
#
# Table name: student_applications
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  applicant_id        :integer
#  semester_id         :integer
#  why_join            :text
#  resume_file_name    :string(255)
#  resume_content_type :string(255)
#  resume_file_size    :integer
#  resume_updated_at   :datetime
#

require 'rails_helper'

RSpec.describe StudentApplication, type: :model do
  it { should belong_to :applicant }
  it { should belong_to :semester }
  it { should validate_presence_of :why_join }
  it { should validate_presence_of :applicant_id }
  it { should validate_presence_of :semester_id }
end

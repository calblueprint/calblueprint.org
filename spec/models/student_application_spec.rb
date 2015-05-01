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
#  phone               :string(255)
#  year                :string(255)
#

require 'rails_helper'

RSpec.describe StudentApplication, type: :model do
  it { should have_one :final_decision }
  it { should belong_to :applicant }
  it { should belong_to :semester }
  it { should validate_presence_of :why_join }
  it { should validate_presence_of :applicant_id }
  it { should validate_presence_of :semester_id }
  it { should validate_attachment_size(:resume).less_than(1.megabytes) }
  it { should validate_attachment_presence(:resume) }
  it { should validate_attachment_content_type(:resume).rejecting('image/png', 'text/plain', 'text/xml') }

  describe "on create" do
    let(:student_application) { create :student_application }

    it "also creates a final decision" do
      expect(student_application.final_decision).not_to be nil
    end
  end
end

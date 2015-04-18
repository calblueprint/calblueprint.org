# == Schema Information
#
# Table name: student_applications
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  applicant_id :integer
#  semester_id  :integer
#  why_join     :text
#

require 'rails_helper'

RSpec.describe StudentApplication, type: :model do
  it { should have_one :final_decision }
  it { should belong_to :applicant }
  it { should belong_to :semester }
  it { should validate_presence_of :why_join }
  it { should validate_presence_of :applicant_id }
  it { should validate_presence_of :semester_id }

  describe "on create" do
    let(:student_application) { create :student_application }

    it "also creates a final decision" do
      expect(student_application.final_decision).not_to be nil
    end
  end
end

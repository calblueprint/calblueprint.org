# == Schema Information
#
# Table name: applicants
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  name                :string
#  email               :string           default(""), not null
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#

require 'rails_helper'

RSpec.describe Applicant, type: :model do
  it { should have_many :student_applications }
  it { should validate_presence_of :email }
  it { should_not validate_presence_of :name }

  describe ".applied_for?" do
    let(:applicant) { create :applicant }
    let(:semester) { create :semester }

    it "returns false if applicant hasn't applied for semester" do
      expect(applicant.applied_for? semester).to be false
    end

    it "returns true if applicant has applied for semester" do
      student_app = create(:student_application)
      student_app.semester = semester
      applicant.student_applications = [student_app]
      expect(applicant.applied_for? semester).to be true
    end
  end
end

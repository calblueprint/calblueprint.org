# == Schema Information
#
# Table name: applicants
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  name                :string(255)
#  email               :string(255)      default(""), not null
#  encrypted_password  :string(255)      default(""), not null
#  remember_created_at :datetime
#

require 'rails_helper'

# rubocop:disable Metrics/AbcSize
def it_returns_applicant_hit
  it "returns the applicant" do
    expect(Applicant.find_for_oauth(create(:auth), applicant)).to eql applicant
  end

  it "does not create a new applicant" do
    expect { Applicant.find_for_oauth create(:auth), applicant }.not_to change { Applicant.count }
  end
end

RSpec.describe Applicant, type: :model do
  it { should have_many :identities }
  it { should have_many :student_applications }
  it { should validate_presence_of :name }

  describe ".find_for_oauth" do
    context "with current_applicant" do
      let!(:applicant) { create :applicant }

      it_returns_applicant_hit
    end

    context "when applicant is found from identity lookup" do
      let!(:applicant) { create :applicant }
      let(:identity) { create :identity, applicant: applicant }
      let(:auth) { auth_from_identity identity }

      it_returns_applicant_hit
    end

    context "when existing applicant is found from email" do
      let!(:applicant) { create :applicant }
      let(:auth) { create :auth, email: applicant.email }

      it_returns_applicant_hit

      context "when identity does not exist" do
        it "creates identity with right applicant" do
          expect { Applicant.find_for_oauth auth }.to change { Identity.count }.by 1
        end
      end
    end

    context "when applicant does not exist" do
      let(:auth) { create :auth }

      it "creates a new applicant" do
        expect { Applicant.find_for_oauth auth }.to change { Applicant.count }.by 1
      end
    end
  end

  describe ".applied_for?" do
    let(:applicant) { create :applicant }
    let(:semester) { create :semester }

    it "returns false if applicant hasn't applied for semester" do
      expect(applicant.applied_for? semester).to be false
    end

    it "returns true if applicant has applied for semester" do
      applicant.student_applications = [create(:student_application, semester: semester)]
      expect(applicant.applied_for? semester).to be true
    end
  end
end

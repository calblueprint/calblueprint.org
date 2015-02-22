# == Schema Information
#
# Table name: identities
#
#  id           :integer          not null, primary key
#  applicant_id :integer
#  provider     :string(255)
#  uid          :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Identity, type: :model do
  it { should belong_to :applicant }
  it { should validate_presence_of :applicant_id }
  it { should validate_presence_of :provider }
  it { should validate_presence_of :uid }

  describe ".find_for_oauth" do
    context "when identity exists" do
      let(:identity) { create :identity }

      it "returns existing identity" do
        expect(Identity.find_for_oauth auth(identity)).to eql identity
      end
    end

    context "when identity does not exist" do
      let(:identity) { build :identity }
      it "returns new identity" do
        expect(Identity.find_for_oauth auth(identity)).not_to be_persisted
      end

      it "returns identity with given attributes" do
        id = Identity.find_for_oauth auth(identity)
        expect(id.provider).to eql identity.provider
        expect(id.uid).to eql identity.uid
      end
    end
  end
end

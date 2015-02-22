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
end

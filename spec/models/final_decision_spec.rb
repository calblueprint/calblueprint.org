# == Schema Information
#
# Table name: final_decisions
#
#  id                :integer          not null, primary key
#  decision          :string
#  decisionable_id   :integer
#  decisionable_type :string
#  created_at        :datetime
#  updated_at        :datetime
#

require 'rails_helper'

RSpec.describe FinalDecision, type: :model do
  it { should validate_presence_of :decisionable_id }
  it { should validate_presence_of :decisionable_type }
  it { should belong_to :decisionable }
end

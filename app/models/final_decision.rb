# == Schema Information
#
# Table name: final_decisions
#
#  id                :integer          not null, primary key
#  admitted          :boolean
#  decisionable_id   :integer
#  decisionable_type :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class FinalDecision < ActiveRecord::Base
  belongs_to :decisionable, polymorphic: true

  validates :decisionable_id, presence: true
  validates :decisionable_type, presence: true
end

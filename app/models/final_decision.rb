# == Schema Information
#
# Table name: final_decisions
#
#  id                :integer          not null, primary key
#  decision          :string(255)
#  decisionable_id   :integer
#  decisionable_type :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class FinalDecision < ActiveRecord::Base
  belongs_to :decisionable, polymorphic: true

  validates :decisionable_id, presence: true
  validates :decisionable_type, presence: true

  include AASM
  aasm column: :decision do
    state :undecided, initial: true
    state :accepted
    state :rejected

    event :accept do
      transitions to: :accepted
    end

    event :reject do
      transitions to: :rejected
    end

    event :remove_decision do
      transitions to: :undecided
    end
  end
end

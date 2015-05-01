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

FactoryGirl.define do
  factory :final_decision do
    decision :undecided
    association :decisionable, factory: :student_application
  end
end

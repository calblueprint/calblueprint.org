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

FactoryGirl.define do
  factory :final_decision do
    admitted false
    association :decisionable, factory: :student_application
  end
end

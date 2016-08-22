FactoryGirl.define do
  factory :comparison do
    association :winner, factory: :student_application
    association :loser, factory: :student_application
    admin
  end
end

FactoryGirl.define do
  factory :hold do
    association :left, factory: :student_application
    association :right, factory: :student_application
    admin
    current_until 15.minutes.from_now

    trait :old do
      current_until 10.minutes.ago
    end
  end
end

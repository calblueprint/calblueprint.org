FactoryGirl.define do
  factory :hold do
    association :left, factory: :student_application
    association :right, factory: :student_application
    admin

    trait :old do
      updated_at 16.minutes.ago
    end
  end
end

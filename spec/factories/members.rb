FactoryGirl.define do
  factory :member do
    sequence(:last_name) { |n| "#{n}" }
    sequence(:email) { |n| "member#{n}@gmail.com" }
    first_name "Member"
  end
end

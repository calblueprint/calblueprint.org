FactoryGirl.define do
  factory :admin do
    first_name "Sam"
    last_name "Lau"
    sequence(:email) { |n| "sam#{n}@sam.com" }
    password "password"
  end
end

FactoryGirl.define do
  factory :nonprofit do
    sequence(:name) { |n| "Nonprofit #{n}" }
    sequence(:email) { |n| "nonprofit#{n}@gmail.com" }
    password "password"
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  role                   :integer          default(0)
#

FactoryGirl.define do
  factory :user do
    first_name "Sam"
    last_name "Lau"
    sequence(:email) { |n| "sam#{n}@sam.com" }
    password "password"

    factory :member do
      role User.roles[:member]
    end

    factory :admin do
      role User.roles[:admin]
    end
  end
end

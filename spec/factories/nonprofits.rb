# == Schema Information
#
# Table name: nonprofits
#
#  id                     :integer          not null, primary key
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
#  name                   :string(255)
#  address                :string(255)
#  phone_number           :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

FactoryGirl.define do
  factory :nonprofit do
    sequence(:name) { |n| "Nonprofit #{n}" }
    sequence(:email) { |n| "nonprofit#{n}@gmail.com" }
    phone_number "1234567890"
    password "password"
  end
end

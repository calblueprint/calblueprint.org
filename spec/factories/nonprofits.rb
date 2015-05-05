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
#  created_at             :datetime
#  updated_at             :datetime
#  organization_name      :string(255)
#

FactoryGirl.define do
  factory :nonprofit do
    sequence(:email) { |n| "nonprofit#{n}@gmail.com" }
    organization_name "Blueprint"
    password "password"
  end
end

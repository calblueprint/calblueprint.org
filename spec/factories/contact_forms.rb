# == Schema Information
#
# Table name: contact_forms
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#  email      :string(255)
#  subject    :string(255)
#  message    :text
#

FactoryGirl.define do
  factory :contact_form do
    name Faker::Name.name
    email Faker::Internet.email
    subject Faker::Lorem.word
    message Faker::Lorem.paragraph
  end
end

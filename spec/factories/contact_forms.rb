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
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { "contact_form_sender@gmail.com" }
    sequence(:subject) { |n| "Contact Form #{n}" }
    sequence(:message) { "Lorem ipsum" }
  end
end

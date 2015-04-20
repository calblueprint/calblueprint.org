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

class ContactForm < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, email: true
  validates :subject, presence: true, length: { maximum: 80 }
  validates :message, presence: true
end

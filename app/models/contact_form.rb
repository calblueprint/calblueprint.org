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
#  message    :string(255)
#

class ContactForm < ActiveRecord::Base
end

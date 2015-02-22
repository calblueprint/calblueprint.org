# == Schema Information
#
# Table name: applicants
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  name                :string(255)
#  email               :string(255)      default(""), not null
#  encrypted_password  :string(255)      default(""), not null
#  remember_created_at :datetime
#

require 'rails_helper'

RSpec.describe Applicant, type: :model do
  it { should validate_presence_of :name }
end

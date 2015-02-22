# == Schema Information
#
# Table name: applicants
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

require 'rails_helper'

RSpec.describe Applicant, type: :model do
end

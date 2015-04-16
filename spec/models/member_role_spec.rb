# == Schema Information
#
# Table name: member_roles
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  role       :string(255)
#

require 'rails_helper'

RSpec.describe MemberRole, type: :model do
  it { should validate_presence_of :role }
  it { should validate_uniqueness_of :role }
end

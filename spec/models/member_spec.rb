# == Schema Information
#
# Table name: members
#
#  id             :integer          not null, primary key
#  created_at     :datetime
#  updated_at     :datetime
#  last_name      :string
#  first_name     :string
#  email          :string
#  member_role_id :integer
#  is_alumnus     :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe Member, type: :model do
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :member_role_id }
end

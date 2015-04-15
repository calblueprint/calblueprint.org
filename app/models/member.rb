# == Schema Information
#
# Table name: members
#
#  id             :integer          not null, primary key
#  created_at     :datetime
#  updated_at     :datetime
#  last_name      :string(255)
#  first_name     :string(255)
#  email          :string(255)
#  member_role_id :integer
#

class Member < ActiveRecord::Base
  belongs_to :member_role

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
  validates :member_role_id, presence: true
end

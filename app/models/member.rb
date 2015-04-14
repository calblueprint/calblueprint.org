# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  last_name  :string(255)
#  first_name :string(255)
#  email      :string(255)
#

class Member < ActiveRecord::Base
  belongs_to :member_role

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
end

# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string
#  last_name              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default("")
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  role                   :string           default("npo_reviewer"), not null
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string
#  invitations_count      :integer          default(0)
#

class Admin < ActiveRecord::Base
  devise :invitable, :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :comparisons
  has_many :holds

  validates :first_name, presence: true
  validates :last_name, presence: true

  ROLES = ["npo_reviewer", "student_reviewer", "super_admin"]
  validates :role, inclusion: { in: ROLES }, allow_nil: false

  state_machine :role, :initial => :npo_reviewer do
    event :promote do
      transition :npo_reviewer => :student_reviewer, :student_reviewer => :super_admin
    end

    event :demote do
      transition :super_admin => :student_reviewer, :student_reviewer => :npo_reviewer
    end
  end
end

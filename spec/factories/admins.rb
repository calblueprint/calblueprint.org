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
#  role                   :integer          default(0)
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string
#  invitations_count      :integer          default(0)
#

FactoryGirl.define do
  factory :admin do
    first_name "Sam"
    last_name "Lau"
    sequence(:email) { |n| "sam#{n}@sam.com" }
    password "password"
  end
end

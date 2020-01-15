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
#  invited_by_type        :string
#  invited_by_id          :integer
#  invitations_count      :integer          default(0)
#

FactoryGirl.define do
  factory :admin do
    first_name "Sam"
    last_name "Lau"
    sequence(:email) { |n| "sam#{n}@sam.com" }
    password "password"

    trait :student_reviewer do
      role 'student_reviewer'
    end

    trait :super_admin do
      role 'super_admin'
    end
  end
end

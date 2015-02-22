# == Schema Information
#
# Table name: identities
#
#  id           :integer          not null, primary key
#  applicant_id :integer
#  provider     :string(255)
#  uid          :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Identity < ActiveRecord::Base
  belongs_to :applicant

  validates :applicant_id, presence: true
  validates :provider, presence: true
  validates :uid, presence: true
end

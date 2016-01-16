# == Schema Information
#
# Table name: nonprofit_applications
#
#  id               :integer          not null, primary key
#  nonprofit_id     :integer
#  semester_id      :integer
#  created_at       :datetime
#  updated_at       :datetime
#  purpose          :text
#  history          :text
#  date_established :date
#  legal            :boolean
#  short_summary    :string
#  goals            :text
#  key_features     :text
#  devices          :string
#  target_audience  :text
#  why              :text
#  cs169_pool       :boolean
#

class NonprofitApplication < ActiveRecord::Base
  POSSIBLE_DEVICES = ["Mobile phones", "Tablets", "Desktops"]
  serialize :devices

  belongs_to :nonprofit
  belongs_to :semester

  validates :nonprofit_id, presence: true
  validates :semester_id, presence: true
  validates :purpose, presence: true
  validates :history, presence: true
  validates :date_established, presence: true
  # legal is validated by database
  validates :short_summary, presence: true, length: { maximum: 255 }
  validates :goals, presence: true
  validates :key_features, presence: true
  validates :devices, presence: true
  validates :target_audience, presence: true
  validates :why, presence: true

  delegate :email, to: :nonprofit
  delegate :organization_name, to: :nonprofit
end

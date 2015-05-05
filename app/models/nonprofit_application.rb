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
#  short_summary    :string(255)
#  goals            :text
#  key_features     :text
#  devices          :string(255)
#  target_audience  :text
#  why              :text
#

class NonprofitApplication < ActiveRecord::Base
  belongs_to :nonprofit
  belongs_to :semester

  validates :nonprofit_id, presence: true
  validates :semester_id, presence: true
  validates :purpose, presence: true
  validates :history, presence: true
  validates :date_established, presence: true
  validates :legal, presence: true
  validates :short_summary, presence: true
  validates :goals, presence: true
  validates :key_features, presence: true
  validates :devices, presence: true
  validates :target_audience, presence: true
  validates :why, presence: true

end

# == Schema Information
#
# Table name: nonprofit_applications
#
#  id           :integer          not null, primary key
#  nonprofit_id :integer
#  semester_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#  purpose      :text
#

class NonprofitApplication < ActiveRecord::Base
  belongs_to :nonprofit
  belongs_to :semester

  validates :nonprofit_id, presence: true
  validates :semester_id, presence: true
  validates :purpose, presence: true
end

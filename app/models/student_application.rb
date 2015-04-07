# == Schema Information
#
# Table name: student_applications
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  applicant_id :integer
#  semester_id  :integer
#

class StudentApplication < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :semester

  validates :applicant_id, presence: true
  validates :semester_id, presence: true
end

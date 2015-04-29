# == Schema Information
#
# Table name: student_applications
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  applicant_id        :integer
#  semester_id         :integer
#  why_join            :text
#  resume_file_name    :string(255)
#  resume_content_type :string(255)
#  resume_file_size    :integer
#  resume_updated_at   :datetime
#  phone               :string(255)
#  year                :string(255)
#

class StudentApplication < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :semester
  has_attached_file :resume
  validates_attachment :resume,
                       content_type: { content_type: "application/pdf" },
                       size: { in: 0..1.megabytes }

  validates_attachment_presence :resume
  validates :applicant_id, presence: true
  validates :semester_id, presence: true
  validates :why_join, presence: true
  validates :phone, presence: true
  validates :year, presence: true
end

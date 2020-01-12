# == Schema Information
#
# Table name: applicants
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  name                :string(255)
#  email               :string(255)      default(""), not null
#  remember_created_at :datetime
#

class Applicant < ActiveRecord::Base
  has_many :identities
  has_many :student_applications
  has_many :external_applications

  validates :email, presence: true

  def applied_for?(semester)
    student_applications.where(semester: semester).present?
  end

  def first_name
    name.split(" ")[0]
  end
end

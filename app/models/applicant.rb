# == Schema Information
#
# Table name: applicants
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  name                :string(255)
#  email               :string(255)      default(""), not null
#  encrypted_password  :string(255)      default(""), not null
#  remember_created_at :datetime
#

class Applicant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable
  validates :name, presence: true
end

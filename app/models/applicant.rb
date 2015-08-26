# == Schema Information
#
# Table name: applicants
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  name                :string
#  email               :string           default(""), not null
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#

class Applicant < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :validatable, :omniauthable

  has_many :identities
  has_many :student_applications

  validates :name, presence: true

  def applied_for?(semester)
    student_applications.where(semester: semester).present?
  end

  def first_name
    name.split(" ")[0]
  end
  # http://sourcey.com/rails-4-omniauth-using-devise-with-twitter-facebook-and-linkedin/
  def self.find_for_oauth(auth, signed_in_resource = nil)
    # Get the identity if exists
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    applicant = signed_in_resource || identity.applicant

    # Grab existing applicant if exists
    applicant ||= find_by email: auth.info.email

    # If not, create new applicant
    applicant ||= create_from_auth auth

    # And associate identity with applicant
    identity.applicant = applicant
    identity.save!

    applicant
  end

  def self.create_from_auth(auth)
    Applicant.create! name: auth.extra.raw_info.name,
                      email: auth.info.email,
                      password: Devise.friendly_token.first(10)
  end
  private_class_method :create_from_auth
end

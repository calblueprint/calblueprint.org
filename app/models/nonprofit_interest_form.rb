# == Schema Information
#
# Table name: nonprofit_interest_forms
#
#  id              :integer          not null, primary key
#  contact_name    :string
#  phone           :string
#  role            :string
#  office_lat      :decimal(, )
#  office_lng      :decimal(, )
#  org_description :text
#  website         :string
#  category        :string
#  agree_to_terms  :boolean
#  submitted_calendly  :boolean
#  nonprofit_id    :integer
#  semester_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  office          :string
#  referrer        :string
#

class NonprofitInterestForm < ActiveRecord::Base
  belongs_to :nonprofit
  belongs_to :semester

  delegate :email, to: :nonprofit
  delegate :organization_name, to: :nonprofit

  phony_normalize :phone, default_country_code: 'US'
  validates :phone, presence: true, phony_plausible: true

  before_validation :url_normalize
  validates :website, presence: true, http_url: true

  validates :nonprofit_id, presence: true
  validates :semester_id, presence: true
  validates :contact_name, presence: true
  validates :org_description, presence: true
  validates :category, presence: true
  validates :role, presence: true
  validates :agree_to_terms, presence: true
  # validates :submitted_calendly, presence: true
  validates :office, presence: true
  validates :referrer, presence: true

  CATEGORIES = [
    "Web application",
    "Mobile application",
    "Other"
  ]

  private

  def url_normalize
    uri = URI.parse(self.website)
    self.website = uri.is_a?(URI::HTTP) ? self.website : "http://#{self.website}"
  rescue URI::InvalidURIError
    self.website
  end

end

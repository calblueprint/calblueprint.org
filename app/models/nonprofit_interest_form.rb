class NonprofitInterestForm < ActiveRecord::Base
  belongs_to :nonprofit
  belongs_to :semester

  delegate :email, to: :nonprofit
  delegate :organization_name, to: :nonprofit

  validates :nonprofit_id, presence: true
  validates :semester_id, presence: true
  validates :contact_name, presence: true
  validates :phone, presence: true
  validates :org_description, presence: true
  validates :category, presence: true
  validates :role, presence: true
  validates :agree_to_terms, presence: true
  validates :office, presence: true
  validates :website, presence: true

  CATEGORIES = [
    "Web application",
    "Mobile application",
    "Other"
  ]

end

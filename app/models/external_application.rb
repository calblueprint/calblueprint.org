# == Schema Information
#
# Table name: external_applications
#
#  id                            :integer          not null, primary key
#  name                          :string
#  phone                         :string
#  email                         :string
#  applicant_id                  :integer
#  semester_id                   :integer
#  operations                    :boolean
#  content                       :boolean
#  design                        :boolean
#  available_for_bp_games        :boolean
#  available_for_retreat         :boolean
#  applied_before                :boolean
#  why_no_bp_games               :text
#  why_no_retreat                :text
#  why_join                      :text
#  design_experience             :text
#  experience                    :text
#  website                       :string
#  year                          :string
#  major                         :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  resume_file_name              :string
#  resume_content_type           :string
#  resume_file_size              :integer
#  resume_updated_at             :datetime
#  social_links                  :text
#  personal_growth               :text
#  additional_option             :string
#  commitments                   :text
#  outreach                      :boolean
#  design_portfolio_file_name    :string
#  design_portfolio_content_type :string
#  design_portfolio_file_size    :integer
#  design_portfolio_updated_at   :datetime
#  design_portfolio_link         :string
#

class ExternalApplication < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :semester

  has_attached_file :resume
  has_attached_file :design_portfolio

  validates_attachment :resume,
                       content_type: { content_type: "application/pdf" },
                       size: { in: 0..1.megabytes }

  validates_attachment :design_portfolio,
                       content_type: { content_type: "application/pdf" },
                       size: { in: 0..10.megabytes }

  validates_attachment_presence :resume
  # validate :design_portfolio_present, if: :design?

  validates :applicant_id, presence: true
  validates :semester_id, presence: true

  validates :applied_before, inclusion: [true, false]
  validates :social_links, presence: true
  validates :personal_growth, presence: true
  validates :why_join, presence: true
  validates :experience, presence: true
  validates :phone, presence: true
  validates :year, presence: true
  validates :name, presence: true
  validates :commitments, presence: true
  validates :major, presence: true
  validates :design_portfolio_link, url: true, allow_blank: true
  validate :at_least_one_position

  # validates_presence_of :design_experience, if: :design?

  validates :email,
            format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
            presence: true

  validates_each :why_join, :experience do |record, attr, value|
    record.errors.add attr, ' - your response must be less than 200 words' if !value.nil? && value.split(" ").length > 200
  end

  validates_each :personal_growth do |record, attr, value|
    record.errors.add attr, ' - your resopnse must be less than 100 words' if !value.nil? && value.split(" ").length > 100
  end

  scope :current, -> { where(semester: Settings.instance.current_semester) }

  def design_portfolio_present
    unless self.design_portfolio_file_size || (not self.design_portfolio_link.empty?)
      errors[:base] << ("Please either upload or provide a link to your design portfolio")
    end
  end

  def at_least_one_position
    if (not [self.operations, self.content, self.design].include? true) && self.additional_option.blank?
      errors[:base] << ("Please choose at least one position to apply for.")
    end
  end

end

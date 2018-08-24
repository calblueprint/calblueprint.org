# == Schema Information
#
# Table name: external_applications
#
#  id                     :integer          not null, primary key
#  name                   :string
#  phone                  :string
#  email                  :string
#  applicant_id           :integer
#  semester_id            :integer
#  operations             :boolean
#  content                :boolean
#  design                 :boolean
#  available_for_bp_games :boolean
#  available_for_retreat  :boolean
#  applied_before         :boolean
#  why_no_bp_games        :text
#  why_no_retreat         :text
#  why_join               :text
#  design_experience      :text
#  experience             :text
#  website                :string
#  year                   :string
#  major                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  resume_file_name       :string
#  resume_content_type    :string
#  resume_file_size       :integer
#  resume_updated_at      :datetime
#  social_links           :text
#  personal_growth        :text
#  additional_option      :string
#  commitments            :text
#

class ExternalApplication < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :semester

  has_attached_file :resume
  validates_attachment :resume,
                       content_type: { content_type: "application/pdf" },
                       size: { in: 0..1.megabytes }

  validates_attachment_presence :resume

  validates :applicant_id, presence: true
  validates :semester_id, presence: true

  validates :social_links, presence: true
  validates :personal_growth, presence: true
  validates :why_join, presence: true
  validates :phone, presence: true
  validates :year, presence: true
  validates :name, presence: true
  validates :commitments, presence: true
  validate :at_least_one_position

  validates_presence_of :design_experience, if: :design?

  validates :email,
            format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
            presence: true

  validates_each :why_join, :experience, :design_experience do |record, attr, value|
    record.errors.add attr, ' - your response must be less than 250 words' if !value.nil? && value.split(" ").length > 260
  end

  scope :current, -> { where(semester: Settings.instance.current_semester) }


  def at_least_one_position
    if (not [self.operations, self.outreach, self.content].include? true) && self.additional_option.blank?
      errors[:base] << ("Please choose at least one position to apply for.")
    end
  end

end

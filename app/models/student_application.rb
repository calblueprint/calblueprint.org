# == Schema Information
#
# Table name: student_applications
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  applicant_id           :integer
#  semester_id            :integer
#  why_join               :text
#  resume_file_name       :string(255)
#  resume_content_type    :string(255)
#  resume_file_size       :integer
#  resume_updated_at      :datetime
#  year                   :string(255)
#  phone                  :string(255)
#  name                   :string
#  email                  :string
#  available_for_bp_games :boolean          default(FALSE)
#  available_for_retreat  :boolean          default(FALSE)
#  wins_count             :integer          default(0)
#  losses_count           :integer          default(0)
#  experience             :text
#  projects               :text
#  service                :text
#  why_no_bp_games        :text
#  why_no_retreat         :text
#  applied_before         :boolean          default(FALSE)
#  version                :integer          default(2)
#

class StudentApplication < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :semester
  has_many :wins, class_name: 'Comparison', foreign_key: 'winner_id'
  has_many :losses, class_name: 'Comparison', foreign_key: 'loser_id'

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
  validates :name, presence: true

  validates :email,
            format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
            presence: true

  validates_presence_of :experience, if: :v2?
  validates_presence_of :projects, if: :v2?
  validates_presence_of :service, if: :v2?
  validates_presence_of :why_no_bp_games, if: :v2?, unless: :available_for_bp_games?
  validates_presence_of :why_no_retreat, if: :v2?, unless: :available_for_retreat?

  validates_each :why_join, :experience, :projects, :service do |record, attr, value|
    record.errors.add attr, ' - your response must be less than 400 words' if record.v2? && !value.nil? && value.split(" ").length > 400
  end

  scope :current, -> { where(semester: Settings.instance.current_semester) }
  scope :remaining, -> {
    current.
      where("wins_count * #{Settings.instance.comparison_bonus} + losses_count * #{Settings.instance.comparison_penalty} >= #{Settings.instance.comparison_threshold}").
      order('wins_count + losses_count ASC')
  }
  scope :needs_comparison, -> {
    remaining.where('wins_count + losses_count = ?', StudentApplication.remaining.minimum("wins_count + losses_count"))
  }

  def v1?
    self.version == 1
  end

  def v2?
    self.version == 2
  end

  def comparisons
    Comparison.where('winner_id = ? OR loser_id = ?', self.id, self.id)
  end
end

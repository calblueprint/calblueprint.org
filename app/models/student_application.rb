# == Schema Information
#
# Table name: student_applications
#
#  id                            :integer          not null, primary key
#  created_at                    :datetime
#  updated_at                    :datetime
#  applicant_id                  :integer
#  semester_id                   :integer
#  why_join                      :text
#  resume_file_name              :string
#  resume_content_type           :string
#  resume_file_size              :integer
#  resume_updated_at             :datetime
#  year                          :string
#  phone                         :string
#  name                          :string
#  email                         :string
#  available_for_bp_games        :boolean          default(FALSE)
#  available_for_retreat         :boolean          default(FALSE)
#  wins_count                    :integer          default(0)
#  losses_count                  :integer          default(0)
#  experience                    :text
#  projects                      :text
#  service                       :text
#  why_no_bp_games               :text
#  why_no_retreat                :text
#  applied_before                :boolean          default(FALSE)
#  version                       :integer          default(2)
#  design_portfolio_file_name    :string
#  design_portfolio_content_type :string
#  design_portfolio_file_size    :integer
#  design_portfolio_updated_at   :datetime
#  add_to_newsletter             :boolean          default(TRUE)
#

class StudentApplication < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :semester
  has_many :wins, class_name: 'Comparison', foreign_key: 'winner_id'
  has_many :losses, class_name: 'Comparison', foreign_key: 'loser_id'
  has_many :left_hold, class_name: 'Hold', foreign_key: 'left_id'
  has_many :right_hold, class_name: 'Hold', foreign_key: 'right_id'

  has_attached_file :resume
  has_attached_file :design_portfolio
  validates_attachment :resume,
                       content_type: { content_type: "application/pdf" },
                       size: { in: 0..1.megabytes }

  validates_attachment :design_portfolio,
                       content_type: { content_type: "application/pdf" },
                       size: { in: 0..10.megabytes }

  validates_attachment_presence :resume
  #validates_attachment_presence :design_portfolio

  validates :applicant_id, presence: true
  validates :semester_id, presence: true

  validates :why_join, presence: true
  validates :hardest_achievement, presence: true
  validates :commitments, presence: true
  validates :phone, presence: true
  validates :year, presence: true
  validates :name, presence: true

  validates :email,
            format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
            presence: true

  validates_presence_of :why_no_bp_games, if: :v2?, unless: :available_for_bp_games?
  validates_presence_of :why_no_retreat, if: :v2?, unless: :available_for_retreat?

  validates_each :why_join, :hardest_achievement, :experience, :projects, :service do |record, attr, value|
    record.errors.add attr, ' - your response must be less than 250 words' if record.v2? && !value.nil? && value.split(" ").length > 260
  end

  scope :current, -> { where(semester: Settings.instance.current_semester) }
  scope :comparable, -> { where.not(id: Hold.current.pluck(:left_id, :right_id).try(:flatten)) }
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

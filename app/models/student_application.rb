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
  has_many :responses, dependent: :destroy
  has_many :questions, through: :responses

  has_many :wins, class_name: 'Comparison', foreign_key: 'winner_id'
  has_many :losses, class_name: 'Comparison', foreign_key: 'loser_id'
  has_many :left_hold, class_name: 'Hold', foreign_key: 'left_id'
  has_many :right_hold, class_name: 'Hold', foreign_key: 'right_id'

  validate :validate_responses

  # Call on each response object to validate itself. Pass Student Application Error Object
  def validate_responses
    self.responses.each do |response|
      response.validate_response errors
    end
  end

  # Helper functions because some other places in the code need these accessors to exist
  def email
    self.response_to("email")
  end

  def name
    self.response_to("name")
  end

  def file_for(tag)
    self.responses.select {|r| r.question.tag.to_s == tag}.first.file
  end

  def response_to(tag)
    response = self.responses.select {|r| r.question.tag.to_s == tag}.first
    answer if response else ""
  end

  def sorted_responses
    cur_semester = Settings.instance.current_semester
    self.responses.sort_by {|r| QuestionSemester.find_by(question: r.question, semester: cur_semester).question_order}
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


  def comparisons
    Comparison.where('winner_id = ? OR loser_id = ?', self.id, self.id)
  end
end

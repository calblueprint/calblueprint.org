# == Schema Information
#
# Table name: questions
#
#  id                     :bigint(8)        not null, primary key
#  title                  :string
#  hint                   :text
#  question_type          :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  required               :boolean          default(TRUE)
#  comparison_category_id :bigint(8)
#  tag                    :string
#  question_category      :integer
#  choices                :string
#  placeholder            :string
#  word_limit             :integer          default(0)
#  file_size_limit        :integer          default(10)
#  input_type             :integer          default("normal")
#

class Question < ActiveRecord::Base
  has_many :question_semesters
  has_many :semesters, through: :question_semesters
  has_many :responses

  validates :title, presence: true
  validates :tag, presence: true, uniqueness: true
  validates :question_type, presence: true
  validates :question_category, presence: true

  enum question_category: [:general, :short_answer, :more_questions, :background]
  enum question_type: [:short_text, :long_text, :multiple_choice_radio, :checkbox, :attachment]
  enum input_type: [:normal, :email, :phone]


  def self.sorted(semester)
    QuestionSemester.where(semester: semester).sort_by(&:question_order).map {|qs| qs.question }
  end

  def hint
    "" if self[:hint].nil?
    self[:hint]
  end

end

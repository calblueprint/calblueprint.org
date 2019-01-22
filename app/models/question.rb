class Question < ActiveRecord::Base
  has_many :question_semesters
  has_many :semesters, through: :question_semesters
  has_many :responses

  validates :title, presence: true
  validates :tag, presence: true, uniqueness: true
  validates :question_type, presence: true
  validates :question_category, presence: true

  enum question_category: [:general, :short_answer, :more_questions]
  enum question_type: [:short_text, :long_text, :multiple_choice_radio, :checkbox, :attachment]
  enum input_type: [:normal, :email, :phone]


  def self.sorted(semester)
    QuestionSemester.where(semester: semester).sort_by(&:question_order).map {|qs| qs.question }
  end

end

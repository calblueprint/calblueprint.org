class QuestionSemester < ActiveRecord::Base
  belongs_to :question
  belongs_to :semester
end

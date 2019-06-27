# == Schema Information
#
# Table name: question_semesters
#
#  id             :bigint(8)        not null, primary key
#  question_order :integer
#  question_id    :bigint(8)
#  semester_id    :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class QuestionSemester < ActiveRecord::Base
  belongs_to :question
  belongs_to :semester
end

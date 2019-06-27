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

require 'rails_helper'

RSpec.describe QuestionSemester, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

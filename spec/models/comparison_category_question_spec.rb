# == Schema Information
#
# Table name: comparison_category_questions
#
#  id                     :bigint(8)        not null, primary key
#  question_id            :bigint(8)
#  comparison_category_id :bigint(8)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe ComparisonCategoryQuestion, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

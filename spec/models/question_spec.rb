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

require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: responses
#
#  id                     :bigint(8)        not null, primary key
#  answer                 :text
#  question_id            :bigint(8)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  file_file_name         :string
#  file_content_type      :string
#  file_file_size         :integer
#  file_updated_at        :datetime
#  student_application_id :bigint(8)
#

require 'rails_helper'

RSpec.describe Response, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

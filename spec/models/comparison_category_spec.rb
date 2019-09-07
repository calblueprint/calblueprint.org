# == Schema Information
#
# Table name: comparison_categories
#
#  id                 :bigint(8)        not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  weight             :decimal(, )
#  comparison_bonus   :decimal(, )
#  comparison_penalty :decimal(, )
#  name               :string
#  application_types  :text             default([]), is an Array
#  semester_id        :bigint(8)
#

require 'rails_helper'

RSpec.describe ComparisonCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

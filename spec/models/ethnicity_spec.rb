# == Schema Information
#
# Table name: ethnicities
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  group      :integer          default("decline_to_state")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Ethnicity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: demographic_surveys
#
#  id                    :bigint(8)        not null, primary key
#  semester_id           :bigint(8)
#  african_american      :boolean
#  latino                :boolean
#  american_indian       :boolean
#  asian                 :boolean
#  white                 :boolean
#  sw_asian_n_african    :boolean
#  pacific_islander      :boolean
#  male                  :boolean
#  female                :boolean
#  nonbinary             :boolean
#  transgender           :boolean
#  intersex              :boolean
#  two_spirit            :boolean
#  gender_nonconforming  :boolean
#  something_else_gender :boolean
#  other_gender          :string
#  decline_gender        :boolean
#  decline_race          :boolean
#  applicant_type        :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'rails_helper'

RSpec.describe DemographicSurvey, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

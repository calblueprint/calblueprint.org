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

class Ethnicity < ApplicationRecord
  has_and_belongs_to_many :demographic_surveys

  # Order for this is the same as how it appears on the survey
  enum group: [
    :decline_to_state,
    :african_american_or_black, 
    :hispanic_or_latino, 
    :american_indian_or_alaskan_native, 
    :asian_or_asian_american, 
    :pacific_islander, 
    :southwest_asian_and_north_african, 
    :white_or_caucasian
  ]
end

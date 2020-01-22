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

class DemographicSurvey < ApplicationRecord
  belongs_to :semester
  has_and_belongs_to_many :ethnicities

  enum applicant_type: { developer: 0, designer: 1, external: 2 }

  validate :at_least_one_gender
  validate :at_least_one_race

  def at_least_one_gender
    if (not [self.male, self.female, self.nonbinary, self.transgender, self.intersex, self.two_spirit, self.gender_nonconforming, self.something_else_gender, self.decline_gender].include? true)
      errors[:base] << ("Please choose at least one for the gender section.")
    end
  end

  def at_least_one_race
    if (self.ethnicity_ids.empty?)
      errors[:base] << ("Please choose at least one for the race/ethnicity section.")
    end
  end
end

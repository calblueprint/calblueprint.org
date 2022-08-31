# == Schema Information
#
# Table name: demographic_surveys
#
#  id                    :bigint(8)        not null, primary key
#  semester_id           :bigint(8)
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
#  applicant_type        :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class DemographicSurvey < ApplicationRecord
  belongs_to :semester
  has_and_belongs_to_many :ethnicities

  enum applicant_type: { Developer: 0, Designer: 1, External: 2, DevDes: 3, DevEx: 4, DesEx: 5, DevDesEx: 6 }

  validate :at_least_one_gender
  validate :at_least_one_race
  validate :at_least_one_sexual_identity_orientation

  def at_least_one_gender
    if (not [self.male, self.female, self.nonbinary, self.transgender, self.intersex, self.two_spirit, self.gender_nonconforming, self.something_else_gender, self.decline_gender].include? true)
      errors[:base] << ("Please choose at least one for the gender section.")
    end
  end

  def at_least_one_sexual_identity_orientation
    if (not [self.asexual, self.bisexual, self.gay, self.lesbian, self.pansexual, self.queer, self.questioning_or_unsure, self.same_gender_loving, self.straight, self.other_sexual_identity_orientation, self.decline_sexual_identity_orientation].include? true)
      errors[:base] << ("Please choose at least one for the Sexual Identity/Orientation section.")
    end
  end

  def at_least_one_race
    if (self.ethnicity_ids.empty?)
      errors[:base] << ("Please choose at least one for the race/ethnicity section.")
    end
  end
end

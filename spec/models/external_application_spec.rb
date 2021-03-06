# == Schema Information
#
# Table name: external_applications
#
#  id                            :integer          not null, primary key
#  name                          :string
#  phone                         :string
#  email                         :string
#  applicant_id                  :integer
#  semester_id                   :integer
#  operations                    :boolean
#  content                       :boolean
#  design                        :boolean
#  available_for_bp_games        :boolean
#  available_for_retreat         :boolean
#  applied_before                :boolean
#  why_no_bp_games               :text
#  why_no_retreat                :text
#  why_join                      :text
#  design_experience             :text
#  experience                    :text
#  website                       :string
#  year                          :string
#  major                         :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  resume_file_name              :string
#  resume_content_type           :string
#  resume_file_size              :integer
#  resume_updated_at             :datetime
#  social_links                  :text
#  personal_growth               :text
#  additional_option             :string
#  commitments                   :text
#  outreach                      :boolean
#  design_portfolio_file_name    :string
#  design_portfolio_content_type :string
#  design_portfolio_file_size    :integer
#  design_portfolio_updated_at   :datetime
#  design_portfolio_link         :string
#  available_for_meet_the_club   :string
#  why_no_meet_the_club          :text
#

require 'rails_helper'

RSpec.describe ExternalApplication, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

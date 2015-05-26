# == Schema Information
#
# Table name: nonprofit_applications
#
#  id               :integer          not null, primary key
#  nonprofit_id     :integer
#  semester_id      :integer
#  created_at       :datetime
#  updated_at       :datetime
#  purpose          :text
#  history          :text
#  date_established :date
#  legal            :boolean
#  short_summary    :string(255)
#  goals            :text
#  key_features     :text
#  devices          :string(255)
#  target_audience  :text
#  why              :text
#

require 'rails_helper'

RSpec.describe NonprofitApplication, type: :model do
  it { should belong_to :nonprofit }
  it { should belong_to :semester }

  it { should validate_presence_of :nonprofit_id }
  it { should validate_presence_of :semester_id }
  it { should validate_presence_of :purpose }
  it { should validate_presence_of :history }
  it { should validate_presence_of :date_established }
  it { should validate_presence_of :short_summary }
  it { should validate_length_of(:short_summary).is_at_most(255) }
  it { should validate_presence_of :goals }
  it { should validate_presence_of :key_features }
  it { should validate_presence_of :devices }
  it { should validate_presence_of :target_audience }
  it { should validate_presence_of :why }

  it { should delegate_method(:email).to(:nonprofit) }
  it { should delegate_method(:organization_name).to(:nonprofit) }
end

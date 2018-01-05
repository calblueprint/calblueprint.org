# == Schema Information
#
# Table name: nonprofit_applications
#
#  id                     :integer          not null, primary key
#  nonprofit_id           :integer
#  semester_id            :integer
#  created_at             :datetime
#  updated_at             :datetime
#  purpose                :text
#  history                :text
#  date_established       :date
#  legal                  :boolean
#  short_summary          :text
#  goals                  :text
#  key_features           :text
#  devices                :string
#  target_audience        :text
#  why                    :text
#  cs169_pool             :boolean          not null
#  client_status          :string
#  technical_requirements :text
#  state                  :string           default("draft"), not null
#  submitted_at           :datetime
#

require 'rails_helper'

RSpec.describe NonprofitApplication, type: :model do
  it { should belong_to :nonprofit }
  it { should belong_to :semester }

  it { should validate_presence_of :nonprofit_id }
  it { should validate_presence_of :semester_id }

  context "if submitted" do
    before { allow(subject).to receive(:submitted?).and_return(true) }
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
    it { should validate_presence_of :technical_requirements }
  end

  context "if draft" do
    before { allow(subject).to receive(:submitted?).and_return(false) }
    it { should_not validate_presence_of :purpose }
    it { should_not validate_presence_of :history }
    it { should_not validate_presence_of :date_established }
    it { should_not validate_presence_of :short_summary }
    it { should_not validate_length_of(:short_summary).is_at_most(255) }
    it { should_not validate_presence_of :goals }
    it { should_not validate_presence_of :key_features }
    it { should_not validate_presence_of :devices }
    it { should_not validate_presence_of :target_audience }
    it { should_not validate_presence_of :why }
    it { should_not validate_presence_of :technical_requirements }
  end

  it { should delegate_method(:email).to(:nonprofit) }
  it { should delegate_method(:organization_name).to(:nonprofit) }
end

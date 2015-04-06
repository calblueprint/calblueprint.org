# == Schema Information
#
# Table name: apps
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  applicant_id :integer
#  semester_id  :integer
#

require 'rails_helper'

RSpec.describe App, type: :model do
  it { should belong_to :applicant }
  it { should belong_to :semester }
  it { should validate_presence_of :applicant_id }
  it { should validate_presence_of :semester_id }
end

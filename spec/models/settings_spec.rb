require 'rails_helper'

RSpec.describe Settings, type: :model do
  it { should validate_inclusion_of(:npo_app_open).in_array([true, false]) }
  it { should validate_inclusion_of(:student_app_open).in_array([true, false]) }
  it { should validate_presence_of :current_semester_id }
end

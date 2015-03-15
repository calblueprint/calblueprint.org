require 'rails_helper'

RSpec.describe Semester, type: :model do
  it { should enumerize(:season).in(:fall, :spring) }
  it { should validate_presence_of :year }
end

require 'rails_helper'

RSpec.describe NonprofitApplication, type: :model do
  it { should belong_to :nonprofit }
  it { should belong_to :semester }
  it { should validate_presence_of :nonprofit_id }
  it { should validate_presence_of :semester_id }
  # pending "add some examples to (or delete) #{__FILE__}"
end

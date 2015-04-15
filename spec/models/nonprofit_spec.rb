require 'rails_helper'

RSpec.describe Nonprofit, type: :model do
  it { should have_many :nonprofit_applications }
  # pending "add some examples to (or delete) #{__FILE__}"
end

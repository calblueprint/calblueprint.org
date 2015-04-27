require "rails_helper"

RSpec.describe "An applicant", type: :feature do
  let(:applicant) { create :applicant }
  before { sign_in applicant }

  subject { page }
end

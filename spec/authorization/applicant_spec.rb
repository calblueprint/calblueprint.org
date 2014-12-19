require "rails_helper"

RSpec.describe "An applicant", type: :feature do
  let(:applicant) { create :applicant }
  before { sign_in applicant }

  subject { page }

  describe "cannot see the" do
    describe "admin dashboard page" do
      before { visit admin_dashboard_path }
      it { should have_content t("unauthorized.default") }
    end
  end
end

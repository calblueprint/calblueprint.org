require "rails_helper"

RSpec.describe "A member", type: :feature do
  let(:member) { create :member }
  before { sign_in member }

  subject { page }

  describe "cannot see the" do
    describe "admin dashboard page" do
      before { visit admin_dashboard_path }
      it { should have_content t("unauthorized.default") }
    end
  end
end

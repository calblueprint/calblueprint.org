require "rails_helper"

RSpec.describe "Nonprofit applications" do
  let(:admin) { create :admin }
  let!(:app1) { create :finished_nonprofit_application }
  let!(:app2) { create :finished_nonprofit_application }

  subject { page }

  before { sign_in admin }

  describe "index page" do
    before { visit admin_nonprofit_applications_path }

    it { should have_content t("admins.nonprofit_applications.index.banner") }

    it "shows each nonprofit app" do
      [app1, app2].each do |app|
        within("tr##{dom_id app}") do
          expect(page).to have_content app.email
        end
      end
    end
  end

  describe "show page" do
    before { visit admin_nonprofit_application_path app1 }

    it { should have_content app1.organization_name }
    it { should have_content app1.why }
  end
end

require "rails_helper"

RSpec.describe "Nonprofit Application Form" do
  let(:nonprofit) { create :nonprofit }

  before do
    visit new_nonprofit_session_path
    fill_in "Email", with: nonprofit.email
    fill_in "Password", with: nonprofit.password
    click_button "Log in"
    visit new_nonprofit_application_path
  end

  subject { page }

  it { should have_content t("nonprofit_applications.new.banner") }

  describe "without filling in form" do
    it "renders back form with errors" do
      click_button "Submit"
      expect(page).to have_content t("nonprofit_applications.new.banner")
      expect(page).to have_content "can't be blank"
    end

    it "does not send email" do
      expect { click_button "Submit" }.not_to change { ActionMailer::Base.deliveries.count }
    end
  end

  describe "after filling in form" do
    before do
      fill_in "Purpose", with: "To change the world."
    end

    it "redirects and renders a success message on submit" do
      click_button "Submit"
      expect(page).not_to have_content t("nonprofit_applications.new.banner")
      expect(page).to have_content t("nonprofit_applications.create.success")
    end

    it "creates a Nonprofit Application on submit" do
      expect { click_button "Submit" }.to change { NonprofitApplication.count }.by(1)
    end

    it "sends an email on submit" do
      expect { click_button "Submit" }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end

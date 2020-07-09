require "rails_helper"

RSpec.describe "Nonprofit Application Form" do
  # Helpers for this spec
  def visit_form
    visit new_nonprofit_session_path
    fill_in "nonprofit_email", with: nonprofit.email
    fill_in "nonprofit_password", with: nonprofit.password
    click_button "Log in"
    visit new_nonprofit_application_path
  end

  def fill_in_form
    app = build :finished_nonprofit_application
    [:purpose, :history, :short_summary, :goals,
     :key_features, :inclusivity, :target_audience, :why, :technical_requirements].each do |attribute|
      fill_in "nonprofit_application_#{attribute}", with: app.send(attribute)
    end
  end

  def submit_form
    click_button "Submit"
  end

  let(:nonprofit) { create :nonprofit }

  it "creates a Nonprofit Application on visit" do
    expect { visit_form }.to change { NonprofitApplication.count }.by(1)
  end

  context "When submitting a new application" do

    before do
      visit_form
    end

    subject { page }

    describe "without filling in form" do
      it "renders back form with errors" do
        submit_form
        expect(page).to have_content "can't be blank"
      end

      it "does not send email" do
        expect { submit_form }.not_to change { ActionMailer::Base.deliveries.count }
      end
    end

    describe "after filling in form" do
      before { fill_in_form }

      it "redirects and renders a success message on submit" do
        submit_form
        expect(page).to have_content t("nonprofit_applications.create.success")
      end

      it "sends an email on submit" do
        expect { submit_form }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end

    describe "filling out form with too long of a summary" do
      it "creates an error about length" do
        fill_in_form
        fill_in "nonprofit_application_short_summary", with: Array.new(256) { rand(36).to_s(36) }.join
        submit_form
        expect(page).to have_content "is too long"
      end
    end
  end
end

require "rails_helper"

RSpec.describe "Contact Us Form" do
  before { visit new_contact_form_path }
  subject { page }

  it { should have_content t("contact_forms.new.banner") }

  describe "without filling in form" do
    before { click_button "Submit" }
    it "renders back form with errors" do
      expect(page).to have_content t("contact_forms.new.banner")
      expect(page).to have_content "can't be blank"
    end
  end

  describe "after filling in form" do
    before do
      fill_in "Subject", with: "Hello"
      fill_in "Name", with: "Sam"
      fill_in "Email", with: "sam@sam.com"
      fill_in "Message", with: "A Message."
    end

    it "redirects and renders a success message on submit" do
      click_button "Submit"
      expect(page).not_to have_content t("contact_forms.new.banner")
      expect(page).to have_content t("contact_forms.create.success")
    end

    it "creates a ContactForm on submit" do
      expect { click_button "Submit" }.to change(ContactForm, :count).by(1)
    end
  end
end

require "rails_helper"

RSpec.describe "Settings" do
  let!(:semester) { create :semester }

  before do
    admin = create :admin, :super_admin
    sign_in admin
    expect(page).to have_content "Signed in successfully."
  end

  subject { page }

  describe "after updating settings" do
    before do
      visit edit_admin_settings_path
      choose "settings_npo_app_open_true"
      choose "settings_student_app_open_true"
      select semester.to_s, from: "Semester"
    end
    it "displays updated settings" do
      click_button "Update Settings"
      expect(page).to have_content "Settings updated."
      expect(page).to have_content semester.to_s
    end
  end
end

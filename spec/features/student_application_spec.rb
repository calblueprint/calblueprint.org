require "rails_helper"

RSpec.describe "Student Application Form" do
  before do
    visit new_student_application_path
    expect(page).to have_content "You need to sign in"
    create_omniauth
    click_link 'Sign in with Facebook'
    visit new_student_application_path
  end

  subject { page }

  it { should have_content t("student_applications.new.banner") }

  describe "without filling in form" do
    it "renders back form with errors" do
      click_button "Submit"
      expect(page).to have_content t("student_applications.new.banner")
      expect(page).to have_content "can't be blank"
    end
  end

  describe "after filling in form" do
    before do
      fill_in "student_application_why_join", with: "I'm really awesome"
      fill_in "student_application_phone", with: "1234567"
      choose "student_application_year_senior"
      attach_file "student_application_resume", "#{Rails.root}/spec/support/fixtures/bops.pdf"
    end

    it "redirects and renders a success message on submit" do
      click_button "Submit"
      expect(page).not_to have_content t("student_applications.new.banner")
      expect(page).to have_content t("student_applications.create.success")
    end

    it "creates a Student Application on submit" do
      expect { click_button "Submit" }.to change { StudentApplication.count }.by(1)
    end
  end
end

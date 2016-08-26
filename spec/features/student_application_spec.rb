require "rails_helper"

RSpec.describe "Student Application Form" do
  before do
    visit new_student_application_path
  end

  subject { page }

  it { should have_content t("student_applications.new.banner") }

  describe "without filling in form" do
    it "renders back form with errors" do
      find(:css, "#available_for_gm").set(true)
      find(:css, "input[type='submit']").click
      expect(page).to have_content t("student_applications.new.banner")
      expect(page).to have_content "can't be blank"
    end
  end

  describe "after filling in form" do
    before do
      fill_in "student_application_name", with: "bob"
      fill_in "student_application_email", with: "bob@email.com"
      fill_in "student_application_why_join", with: "I'm really awesome"
      fill_in "student_application_phone", with: "1234567"
      choose "student_application_year_senior"
      attach_file "student_application_resume", "#{Rails.root}/spec/support/fixtures/bops.pdf"
      fill_in "student_application_experience", with: FFaker::Lorem.paragraph
      # Don't fill out projects
      fill_in "student_application_service", with: FFaker::Lorem.paragraph
      find(:css, "#available_for_gm").set(true)
    end

    it "redirects and renders a success message on submit" do
      find(:css, "input[type='submit']").click
      expect(page).not_to have_content t("student_applications.new.banner")
      expect(page).to have_content t("student_applications.create.success")
    end

    it "creates a Student Application on submit" do
      expect { find(:css, "input[type='submit']").click }.to change { StudentApplication.count }.by(1)
    end
  end
end

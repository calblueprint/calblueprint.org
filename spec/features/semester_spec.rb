require "rails_helper"

RSpec.describe "Semester" do
  before do
    admin = FactoryGirl.create(:admin, first_name: 'Kevin',
      last_name: 'Admin', email: 'kevin@admin.com', password: 'password')
    sign_in admin
    expect(page).to have_content "Signed in successfully."
  end

  subject { page }

  describe "without filling in semester details" do
    before { visit new_admin_semester_path }
    it "renders back form with errors" do
      click_button "Create Semester"
      expect(page).to have_content "can't be blank"
    end
  end

  describe "after filling in semester details" do
    before { fill_in_semester("Spring", "test1") }
    it "redirects to semesters page on submit" do
      click_button "Create Semester"
      expect(page).to have_content "test1"
    end
  end

  describe "after creating a duplicate semester" do
    before do
      fill_in_semester("Spring", "test2")
      click_button "Create Semester"
      fill_in_semester("Spring", "test2")
    end

    it "renders back form with errors" do
      click_button "Create Semester"
      expect(page).to have_content "has already been taken"
    end
  end

  describe "after delete attempt on non-empty semester" do
    before do
      app = build :app
      semester = create :semester
      semester.year = "test3"
      semester.apps << app
      semester.save
      visit admin_semesters_path
    end

    it "renders back page with nothing" do
      expect(page).to have_content "test3"
      click_link "delete-spring-test3"
      expect(page).to have_content "test3"
    end
  end

  describe "after delete attempt on empty semester" do
    before do
      fill_in_semester("Spring", "test4")
      click_button "Create Semester"
      visit admin_semesters_path
    end

    it "renders back page without deleted semester" do
      expect(page).to have_content "test4"
      click_link "delete-spring-test4"
      expect(page).not_to have_content "test4"
    end
  end

  describe "after creating new current semester" do
    before do
      visit new_admin_semester_path
      fill_in_semester("Spring", "test5", true)
      click_button "Create Semester"

      visit new_admin_semester_path
      fill_in_semester("Spring", "test6", true)
      click_button "Create Semester"
    end

    it "checks new current semester" do
      visit admin_semesters_path
      click_link "edit-spring-test6"
      box = find_by_id "is_current_semester"
      expect(box.checked?).to eq "checked"
    end

    it "unchecks old current semester" do
      visit admin_semesters_path
      click_link "edit-spring-test5"
      box = find_by_id "is_current_semester"
      expect(box.checked?).to eq nil
    end
  end
end

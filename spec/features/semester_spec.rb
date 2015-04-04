require "rails_helper"

def fill_in_semester(season, year, is_current_semester = false)
  visit new_admin_semester_path
  select season, from: "Season:"
  fill_in "Year", with: year
  check "Current Semester" if is_current_semester
end

RSpec.describe "Semester" do
  let(:student_application) { create :student_application }
  let!(:semester_empty) { create :semester, season: "spring", year: "test_empty", is_current_semester: true }
  let!(:semester_nonempty) { create :semester, season: "spring", year: "test_nonempty", is_current_semester: true, student_applications: [student_application] }

  before do
    admin = create :admin
    sign_in admin
    expect(page).to have_content "Signed in successfully."
  end

  subject { page }

  describe "without filling in semester details" do
    before { visit new_admin_semester_path }
    it "renders back form with errors" do
      expect { click_button "Create Semester" }.not_to change { Semester.count }
      expect(page).to have_content "can't be blank"
    end
  end

  describe "after filling in semester details" do
    before { fill_in_semester "Spring", "test_new" }
    it "redirects to semesters page on submit" do
      expect { click_button "Create Semester" }.to change { Semester.count }.by 1
      expect(page).to have_content "test_new"
    end
  end

  describe "after creating a duplicate semester" do
    before { fill_in_semester "Spring", "test_nonempty", true }
    it "renders back form with errors" do
      expect { click_button "Create Semester" }.not_to change { Semester.count }
      expect(page).to have_content "has already been taken"
    end
  end

  describe "after delete" do
    context "non-empty semester" do
      before { visit admin_semesters_path }
      it "renders back page with nothing" do
        expect { click_link "delete-spring-test_nonempty" }.not_to change { Semester.count }
      end
    end

    context "empty semester" do
      before { visit admin_semesters_path }
      it "renders back page without deleted semester" do
        expect { click_link "delete-spring-test_empty" }.to change { Semester.count }.by (-1)
      end
    end
  end

  describe "after creating new current semester" do
    before do
      visit new_admin_semester_path
      fill_in_semester "Spring", "test_current", true
      click_button "Create Semester"
    end

    it "checks new current semester" do
      visit admin_semesters_path
      click_link "edit-spring-test_current"
      box = find_by_id "is_current_semester"
      expect(box.checked?).to eq "checked"
      expect(Semester.current_semester.year).to eq "test_current"
    end

    it "unchecks old current semester" do
      visit admin_semesters_path
      click_link "edit-spring-test_nonempty"
      box = find_by_id "is_current_semester"
      expect(box.checked?).to eq nil
    end
  end
end
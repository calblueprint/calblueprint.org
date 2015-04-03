# require "rails_helper"

# # Should be moved out
# include Warden::Test::Helpers
# Warden.test_mode!

# RSpec.configure do |config|
#   config.after :each do
#     Warden.test_reset!
#   end
# end

# RSpec.describe "Semester" do
#   before do
#     admin = FactoryGirl.build(:admin, first_name: 'Kevin', last_name: 'Admin', email: 'kevin@admin.com', password: 'password')
#     login_as(admin, :scope => :admin)
#     subject { page }
#   end

#   describe "without filling in semester details" do
#     before do
#       visit new_admin_semester_path
#     end
#     it "renders back form with errors" do
#       click_button "Create Semester"
#       expect(page).to have_content "can't be blank"
#     end
#   end

#   describe "after filling in semester details" do
#     before do
#       visit new_admin_semester_path
#       select "Fall", from: "Season"
#       fill_in "Year", with: "2015"
#     end

#     it "redirects to semesters page on submit" do
#       click_button "Create Semester"
#       expect(page).to have_content "2015"
#     end
#   end

  # describe "after creating a duplicate semester" do
  #   before do
  #     select "Fall", from: "Season:"
  #     fill_in "Year", with: "2015"
  #     check "Current Semester"
  #   end

  #   it "renders back form with errors" do
  #     click_button "Create Semester"
  #     expect(page).to have_content "has already been taken"
  #   end
  # end

  # describe "after delete attempt on non-empty semester" do
  #   before do
  #     visit admin_semesters_path
  #   end

  #   it "renders back page with nothing" do
  #     click_button "Delete"
  #   end
  # end

  # describe "after delete attempt on empty semester" do
  #   before do
  #     select "Spring", from: "Season"
  #     fill_in "Year", with: "2016"
  #   end

  #   it "renders back page without deleted semester" do
  #     click_button "Delete"
  #     expect(page).not_to have_content "2016"
  #   end
  # end
# end

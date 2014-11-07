require "rails_helper"

RSpec.describe "The app works" do
  describe "if the home page" do
    before { visit root_path }

    it "works" do
      expect(page).to have_content "Hello world!"
    end
  end
end

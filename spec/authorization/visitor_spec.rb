require "rails_helper"

RSpec.describe "A visitor", type: :feature do
  describe "can" do
    subject { page }

    describe "see the home page" do
      before { visit root_path }
      it { should have_content t('pages.home.title') }
    end
  end
end

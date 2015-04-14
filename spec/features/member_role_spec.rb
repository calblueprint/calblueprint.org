require "rails_helper"

RSpec.describe "Member Role" do
  let(:member) { create :member }
  let!(:member_role_empty) { create :member_role, role: "empty role" }
  let!(:member_role_nonempty) { create :member_role, role: "nonempty role", members: [member] }

  before do
    admin = create :admin
    sign_in admin
    expect(page).to have_content "Signed in successfully."
  end

  subject { page }

  describe "without filling in member role" do
    before { visit new_admin_member_role_path }
    it "renders back form with errors" do
      expect { click_button "Create Member role" }.not_to change { MemberRole.count }
      expect(page).to have_content "can't be blank"
    end
  end

  describe "after filling in member role" do
    before do
      visit new_admin_member_role_path
      fill_in "Role", with: "Developer"
    end
    it "redirects to member role page on submit" do
      expect { click_button "Create Member role" }.to change { MemberRole.count }.by(1)
      expect(page).to have_content "Developer"
    end
  end

  describe "after creating a duplicate member role" do
    before do
      visit new_admin_member_role_path
      fill_in "Role", with: "empty role"
    end
    it "renders back form with errors" do
      expect { click_button "Create Member role" }.not_to change { MemberRole.count }
      expect(page).to have_content "has already been taken"
    end
  end

  describe "after delete" do
    context "non-empty member role" do
      before { visit admin_member_roles_path }
      it "renders back page with no changes" do
        expect { click_link "delete-nonempty_role" }.not_to change { MemberRole.count }
      end
    end

    context "empty member role" do
      before { visit admin_member_roles_path }
      it "renders back page without deleted member role" do
        expect { click_link "delete-empty_role" }.to change { MemberRole.count }.by(-1)
      end
    end
  end
end

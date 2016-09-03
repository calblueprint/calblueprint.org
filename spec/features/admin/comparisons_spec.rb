require "rails_helper"

RSpec.describe "Comparisons" do
  let!(:app_1) { create(:student_application, :old, wins_count: 1) }
  let!(:app_2) { create(:student_application, :old, losses_count: 1) }
  let!(:app_3) { create(:student_application, :current, wins_count: 2) }
  let!(:app_4) { create(:student_application, :current, losses_count: 1) }
  let!(:app_5) { create(:student_application, :current, wins_count: 1, losses_count: 1) }
  let!(:app_6) { create(:student_application, :current, losses_count: 1) }

  subject { page }

  context 'logged in as a student reviewer' do
    let!(:student_reviewer) { create(:admin, :student_reviewer) }

    before do
      sign_in student_reviewer
      expect(page).to have_content "Signed in successfully."
    end

    describe "begin a new comparison" do
      let(:new_hold) { Hold.first }
      let(:nil_comparison) { Comparison.last } #HACK: Gets around being unable to reload a nil value
      let(:new_comparison) { Comparison.last }

      before do
        visit new_admin_comparison_path
      end

      it "admin can choose between two applications among those with the fewest comparisons" do
        expect(new_hold.current?).to eq true
        expect(nil_comparison).to be_nil
        expect([new_hold.right_id, new_hold.left_id]).to contain_exactly app_4.id, app_6.id
        expect(new_hold.admin_id).to eq student_reviewer.id

        expect(page).to have_content app_4.why_join
        expect(page).to have_content app_6.why_join
        click_button 'Left is better!'

        new_hold.reload

        expect(page).to have_content t('admins.comparisons.create.success')
        expect(new_hold.current?).to eq false
        expect([new_comparison.winner_id, new_comparison.loser_id]).to contain_exactly app_4.id, app_6.id
        expect(new_hold.left.wins_count).to eq 1
        expect(new_hold.right.losses_count).to eq 2
      end
    end
  end

  # context 'logged in as a super admin' do
  #   before do
  #     super_admin = create :admin, :super_admin
  #     sign_in super_admin
  #     expect(page).to have_content "Signed in successfully."
  #   end
  #
  # end
end

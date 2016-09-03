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

      it "admin can choose between two applications among those with the fewest comparisons" do
        visit new_admin_comparison_path

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

      it "admin can make a comparison if their hold lapses but no one else grabs a hold" do
        visit new_admin_comparison_path

        expect(new_hold.current?).to eq true
        expect(nil_comparison).to be_nil
        expect([new_hold.right_id, new_hold.left_id]).to contain_exactly app_4.id, app_6.id
        expect(new_hold.admin_id).to eq student_reviewer.id

        new_hold.release
        expect(new_hold.current?).to eq false

        expect(page).to have_content app_4.why_join
        expect(page).to have_content app_6.why_join
        click_button 'Left is better!'

        expect(page).to have_content t('admins.comparisons.create.success')
        expect([new_comparison.winner_id, new_comparison.loser_id]).to contain_exactly app_4.id, app_6.id
        expect(new_hold.left.wins_count).to eq 1
        expect(new_hold.right.losses_count).to eq 2
      end

      it "admin cannot make a comparison if their hold lapses and someone holds one of the applications" do
        visit new_admin_comparison_path

        expect(new_hold.current?).to eq true
        expect(nil_comparison).to be_nil
        expect([new_hold.right_id, new_hold.left_id]).to contain_exactly app_4.id, app_6.id
        expect(new_hold.admin_id).to eq student_reviewer.id

        new_hold.release
        expect(new_hold.current?).to eq false
        create(:hold, left: app_4, right: app_5)

        expect(page).to have_content app_4.why_join
        expect(page).to have_content app_6.why_join
        click_button 'Left is better!'

        expect(page).to have_content t('admins.comparisons.create.held')
        expect(new_comparison).to be_nil
        expect(new_hold.left.wins_count).to eq 0
        expect(new_hold.right.losses_count).to eq 1
      end
    end
  end

  context 'multiple student_reviewers logged in' do
    let!(:student_reviewer_1) { create(:admin, :student_reviewer) }
    let!(:student_reviewer_2) { create(:admin, :student_reviewer) }
    let(:first_hold) { Hold.first }
    let(:second_hold) { Hold.second }
    let(:nil_comparison_1) { Comparison.last } #HACK: Gets around being unable to reload a nil value
    let(:nil_comparison_2) { Comparison.last } #HACK: Gets around being unable to reload a nil value
    let(:first_comparison) { Comparison.first }
    let(:second_comparison) { Comparison.second }

    it 'blocks student reviewers from getting held applications' do
      in_browser(:one) do
        sign_in student_reviewer_1
        expect(page).to have_content "Signed in successfully."

        visit new_admin_comparison_path

        expect(first_hold.current?).to eq true
        expect(nil_comparison_1).to be_nil
        expect([first_hold.right_id, first_hold.left_id]).to contain_exactly app_4.id, app_6.id
        expect(first_hold.admin_id).to eq student_reviewer_1.id

        expect(page).to have_content app_4.why_join
        expect(page).to have_content app_6.why_join
      end

      in_browser(:two) do
        sign_in student_reviewer_2
        expect(page).to have_content "Signed in successfully."

        visit new_admin_comparison_path

        expect(second_hold.current?).to eq true
        expect(nil_comparison_2).to be_nil
        expect([second_hold.right_id, second_hold.left_id]).to contain_exactly app_3.id, app_5.id
        expect(second_hold.admin_id).to eq student_reviewer_2.id

        expect(page).to have_content app_3.why_join
        expect(page).to have_content app_5.why_join
      end

      in_browser(:one) do
        click_button 'Left is better!'

        first_hold.reload

        expect(page).to have_content t('admins.comparisons.create.success')
        expect(first_hold.current?).to eq false
        expect([first_comparison.winner_id, first_comparison.loser_id]).to contain_exactly app_4.id, app_6.id
        expect(first_hold.left.wins_count).to eq 1
        expect(first_hold.right.losses_count).to eq 2
      end

      in_browser(:two) do
        click_button 'Right is better!'

        second_hold.reload

        expect(page).to have_content t('admins.comparisons.create.success')
        expect(second_hold.current?).to eq false
        expect([second_comparison.winner_id, second_comparison.loser_id]).to contain_exactly app_3.id, app_5.id
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

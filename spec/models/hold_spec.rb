require 'rails_helper'

describe Hold do
  context 'relations' do
    it { should belong_to(:left).class_name('StudentApplication') }
    it { should belong_to(:right).class_name('StudentApplication') }
    it { should belong_to :admin }
  end

  context 'validations' do
    it { should validate_presence_of :left_id }
    it { should validate_presence_of :right_id }
    it { should validate_presence_of :admin_id }

    context 'the left and right are the same' do
      let!(:app_1) { create(:student_application) }
      subject { build(:hold, left: app_1, right: app_1) }

      it { should_not be_valid }
    end

    context 'the winner and loser are the different' do
      let!(:app_1) { create(:student_application) }
      let!(:app_2) { create(:student_application) }
      let!(:app_3) { create(:student_application) }

      context 'there are no holds on the apps' do
        subject { build(:hold, left: app_1, right: app_2) }

        it { should be_valid }
      end

      context 'there is a current hold on app_1 in the left position' do
        let!(:app1_hold) { create(:hold, left: app_1, right: app_3) }

        subject { build(:hold, left: app_2, right: app_1) }
        it { should_not be_valid }

        subject { build(:hold, left: app_1, right: app_2) }
        it { should_not be_valid }
      end

      context 'there is a current hold on app_1 in the right position' do
        let!(:app1_hold) { create(:hold, left: app_3, right: app_1) }

        subject { build(:hold, left: app_1, right: app_2) }
        it { should_not be_valid }

        subject { build(:hold, left: app_2, right: app_1) }
        it { should_not be_valid }
      end

      context 'there is an old hold on app_1 in the left position' do
        let!(:app1_hold) { create(:hold, :old, left: app_1, right: app_3) }

        subject { build(:hold, left: app_2, right: app_1) }
        it { should be_valid }

        subject { build(:hold, left: app_1, right: app_2) }
        it { should be_valid }
      end

      context 'there is an old hold on app_1 in the right position' do
        let!(:app1_hold) { create(:hold, :old, left: app_3, right: app_1) }

        subject { build(:hold, left: app_1, right: app_2) }
        it { should be_valid }

        subject { build(:hold, left: app_2, right: app_1) }
        it { should be_valid }
      end

      context 'the admin already has a current hold' do
        let!(:app_4) { create(:student_application) }
        let!(:admin) { create(:admin) }
        let!(:admin_hold) { create(:hold, admin: admin, left: app_1, right: app_2) }
        subject { build(:hold, admin: admin, left: app_3, right: app_4) }

        it { should_not be_valid }
      end
    end
  end
end

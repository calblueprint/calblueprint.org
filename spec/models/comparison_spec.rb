require 'rails_helper'

describe Comparison do
  context 'relations' do
    it { should belong_to(:winner).class_name('StudentApplication') }
    it { should belong_to(:loser).class_name('StudentApplication') }
    it { should belong_to :admin }
  end

  context 'validations' do
    it { should validate_presence_of :winner_id }
    it { should validate_presence_of :loser_id }
    it { should validate_presence_of :admin_id }

    context 'the winner and loser are the same' do
      let!(:app_1) { create(:student_application) }
      subject { build(:comparison, winner: app_1, loser: app_1) }

      it { should_not be_valid }
    end

    context 'the winner and loser are the different' do
      let!(:app_1) { create(:student_application) }
      let!(:app_2) { create(:student_application) }
      subject { build(:comparison, winner: app_1, loser: app_2) }

      it { should be_valid }
    end
  end
end

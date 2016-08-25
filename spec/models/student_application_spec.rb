# == Schema Information
#
# Table name: student_applications
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  applicant_id           :integer
#  semester_id            :integer
#  why_join               :text
#  resume_file_name       :string
#  resume_content_type    :string
#  resume_file_size       :integer
#  resume_updated_at      :datetime
#  year                   :string
#  phone                  :string
#  name                   :string
#  email                  :string
#  available_for_bp_games :boolean          default(FALSE)
#  available_for_retreat  :boolean          default(FALSE)
#

require 'rails_helper'

describe StudentApplication do
  context 'relations' do
    it { should belong_to :applicant }
    it { should belong_to :semester }
  end

  context 'validations' do
    it { should validate_presence_of :why_join }
    it { should validate_presence_of :applicant_id }
    it { should validate_presence_of :semester_id }
    it { should validate_attachment_size(:resume).less_than(1.megabytes) }
    it { should validate_attachment_presence(:resume) }
    it { should validate_attachment_content_type(:resume).rejecting('image/png', 'text/plain', 'text/xml') }

    context 'if v2' do
      before { allow(subject).to receive(:v2?).and_return(true) }
      it { should validate_presence_of :experience }
      it { should validate_presence_of :projects }
      it { should validate_presence_of :service }

      context 'if cannot attend bp_games' do
        before { allow(subject).to receive(:available_for_bp_games?).and_return(false) }
        it { should validate_presence_of :why_no_bp_games }
      end

      context 'if can attend bp_games' do
        before { allow(subject).to receive(:available_for_bp_games?).and_return(true) }
        it { should_not validate_presence_of :why_no_bp_games }
      end

      context 'if cannot attend retreat' do
        before { allow(subject).to receive(:available_for_retreat?).and_return(false) }
        it { should validate_presence_of :why_no_retreat }
      end

      context 'if can attend retreat' do
        before { allow(subject).to receive(:available_for_retreat?).and_return(true) }
        it { should_not validate_presence_of :why_no_retreat }
      end

      describe 'word count validations' do
        let(:app) { build(:student_application, :v2) }

        it 'it should disallow v2 field when they have too many words' do
          [:why_join, :experience, :projects, :service].each do |field|
            app[field] = words(261)
            app.should_not be_valid
            app[field] = words(259)
            app.should be_valid
          end
        end
      end
    end
  end

  context 'scopes' do
    let!(:app_1) { create(:student_application, :old, wins_count: 1) }
    let!(:app_2) { create(:student_application, :old, losses_count: 1) }
    let!(:app_3) { create(:student_application, :current, wins_count: 2) }
    let!(:app_4) { create(:student_application, :current, losses_count: 1) }
    let!(:app_5) { create(:student_application, :current, wins_count: 1, losses_count: 1) }
    let!(:app_6) { create(:student_application, :current, losses_count: 1) }

    describe '.current' do
      let(:current) { StudentApplication.current }

      it 'includes only the current applications' do
        current.should include(app_3, app_4, app_5, app_6)
      end

      it 'does not include old applications' do
        current.should_not include(app_1, app_2)
      end
    end

    describe '.remaining' do
      let(:remaining) { StudentApplication.remaining }

      context 'when the penalty is 0, the bonus is 0 and the threshold is 0' do
        it 'includes only the current applications ordered by total comparisons' do
          remaining.should match_array([app_4, app_6, app_3, app_5])
        end

        it 'does not include old applications' do
          remaining.should_not include(app_1, app_2)
        end
      end

      context 'when the penalty is -1, the bonus is 0 and the threshold is 0' do
        before do
          Settings.instance.update_attributes(comparison_penalty: -1)
        end

        it 'includes only the current applications without any losses' do
          remaining.should match_array([app_3])
        end

        it 'does not include old applications or applications with losses' do
          remaining.should_not include(app_1, app_2, app_4, app_5, app_6)
        end
      end

      context 'when the penalty is -1, the bonus is 1 and the threshold is 0' do
        before do
          Settings.instance.update_attributes(comparison_bonus: 1, comparison_penalty: -1)
        end

        it 'includes only the current applications where wins_count is >= losses_count' do
          remaining.should match_array([app_3, app_5])
        end

        it 'does not include old applications or applications with more losses than wins' do
          remaining.should_not include(app_1, app_2, app_4, app_6)
        end
      end

      context 'when the penalty is -1, the bonus is 0 and the threshold is 1' do
        before do
          Settings.instance.update_attributes(comparison_threshold: 1, comparison_penalty: -1)
        end

        it 'includes nothing' do
          remaining.should match_array([])
        end

        it 'does not include all applications' do
          remaining.should_not include(app_1, app_2, app_3, app_4, app_5, app_6)
        end
      end
    end

    describe '.needs_comparison' do
      let(:needs_comparison) { StudentApplication.needs_comparison }

      it 'includes remaining applications with the smallest number of comparisons' do
        needs_comparison.should include(app_4, app_6)
      end

      it 'does not include old applications' do
        needs_comparison.should_not include(app_1, app_2, app_3, app_5)
      end
    end
  end

  describe '#comparisons' do
    let!(:app_1) { create(:student_application, :old) }
    let!(:app_2) { create(:student_application, :old) }
    let!(:app_3) { create(:student_application, :current) }

    let!(:comparison_1) { create(:comparison, winner: app_1) }
    let!(:comparison_2) { create(:comparison, loser: app_1) }
    let!(:comparison_3) { create(:comparison, winner: app_2) }
    let!(:comparison_4) { create(:comparison, winner: app_2, loser: app_3) }

    it 'returns associated comparions' do
      app_1.comparisons.should include(comparison_1, comparison_2)
      app_2.comparisons.should include(comparison_3, comparison_4)
      app_3.comparisons.should include(comparison_4)
    end

    it 'does not return unrelated comparisons' do
      app_1.comparisons.should_not include(comparison_3, comparison_4)
      app_2.comparisons.should_not include(comparison_1, comparison_2)
      app_3.comparisons.should_not include(comparison_1, comparison_2, comparison_3)
    end
  end
end

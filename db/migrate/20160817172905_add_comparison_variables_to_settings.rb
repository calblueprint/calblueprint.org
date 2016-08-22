class AddComparisonVariablesToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :comparison_bonus, :integer, default: 0
    add_column :settings, :comparison_penalty, :integer, default: 0
    add_column :settings, :comparison_threshold, :integer, default: 0
    add_column :settings, :applicants_remaining, :integer, default: 0
  end
end

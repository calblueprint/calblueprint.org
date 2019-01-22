class AddWeightsToComparisonCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :comparison_categories, :weight, :decimal
    add_column :comparison_categories, :comparison_bonus, :decimal
    add_column :comparison_categories, :comparison_penalty, :decimal
  end
end

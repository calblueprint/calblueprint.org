class AddComparisonCategoryToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :comparison_category, foreign_key: true
    add_reference :comparisons, :comparison_category, foreign_key: true
  end
end

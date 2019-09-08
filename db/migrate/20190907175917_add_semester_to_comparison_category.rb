class AddSemesterToComparisonCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :comparison_categories, :semester, foreign_key: true
  end
end

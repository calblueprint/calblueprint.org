class AddComparisonCategoryToHold < ActiveRecord::Migration[5.2]
  def change
    add_reference :holds, :comparison_category, foreign_key: true
  end
end

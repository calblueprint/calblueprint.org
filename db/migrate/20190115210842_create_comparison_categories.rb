class CreateComparisonCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :comparison_categories do |t|

      t.timestamps
    end
  end
end

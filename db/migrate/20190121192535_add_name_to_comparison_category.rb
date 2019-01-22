class AddNameToComparisonCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :comparison_categories, :name, :string
  end
end

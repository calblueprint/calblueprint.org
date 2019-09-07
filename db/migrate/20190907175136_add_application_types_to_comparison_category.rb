class AddApplicationTypesToComparisonCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :comparison_categories, :application_types, :text, array: true, default: []
  end
end

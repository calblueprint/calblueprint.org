class RemoveYearFromApps < ActiveRecord::Migration[4.2]
  def change
    remove_column :apps, :year, :string
  end
end

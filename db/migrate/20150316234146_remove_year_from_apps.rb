class RemoveYearFromApps < ActiveRecord::Migration
  def change
    remove_column :apps, :year, :string
  end
end

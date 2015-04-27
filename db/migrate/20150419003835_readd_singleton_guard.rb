class ReaddSingletonGuard < ActiveRecord::Migration
  def change
    add_column :settings, :singleton_guard, :integer
    add_index :settings, :singleton_guard, unique: true
  end
end

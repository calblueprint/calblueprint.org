class ReaddSingletonGuard < ActiveRecord::Migration[4.2]
  def change
    add_column :settings, :singleton_guard, :integer
    add_index :settings, :singleton_guard, unique: true
  end
end

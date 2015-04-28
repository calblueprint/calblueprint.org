class RemoveSingletonGuard < ActiveRecord::Migration
  def change
    remove_column :settings, :singleton_guard, :integer
  end
end

class RemoveSingletonGuard < ActiveRecord::Migration[4.2]
  def change
    remove_column :settings, :singleton_guard, :integer
  end
end

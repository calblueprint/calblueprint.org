class AddSingletonGuardToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :singleton_guard, :integer
  end
end

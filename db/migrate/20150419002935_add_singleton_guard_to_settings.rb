class AddSingletonGuardToSettings < ActiveRecord::Migration[4.2]
  def change
    add_column :settings, :singleton_guard, :integer
  end
end

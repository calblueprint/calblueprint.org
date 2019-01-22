class RemoveAllAppsFields < ActiveRecord::Migration[4.2]
  def change
    remove_column :apps, :last_name, :string
    remove_column :apps, :first_name, :string
    remove_column :apps, :email, :string
  end
end

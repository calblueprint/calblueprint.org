class RenameUserToAdmin < ActiveRecord::Migration[4.2]
  def change
    rename_table :users, :admins
  end
end

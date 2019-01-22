class AddRoleToAdmin < ActiveRecord::Migration[4.2]
  def change
    change_column :admins, :role, :string, null: false, default: 'npo_reviewer'
  end
end

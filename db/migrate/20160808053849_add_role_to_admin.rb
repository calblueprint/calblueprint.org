class AddRoleToAdmin < ActiveRecord::Migration
  def change
    change_column :admins, :role, :string, null: false, default: 'npo_reviewer'
  end
end

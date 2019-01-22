class AddMemberRolesToMember < ActiveRecord::Migration[4.2]
  def change
    add_column :members, :member_role_id, :integer
    add_index :members, :member_role_id
  end
end

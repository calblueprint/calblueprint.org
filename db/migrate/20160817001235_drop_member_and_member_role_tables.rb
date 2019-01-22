class DropMemberAndMemberRoleTables < ActiveRecord::Migration[4.2]
  def change
    drop_table :member_roles
    drop_table :members
  end
end

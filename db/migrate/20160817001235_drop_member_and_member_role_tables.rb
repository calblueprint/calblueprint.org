class DropMemberAndMemberRoleTables < ActiveRecord::Migration
  def change
    drop_table :member_roles
    drop_table :members
  end
end

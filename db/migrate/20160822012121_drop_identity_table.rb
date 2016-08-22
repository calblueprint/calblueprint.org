class DropIdentityTable < ActiveRecord::Migration
  def change
    drop_table :identities
  end
end

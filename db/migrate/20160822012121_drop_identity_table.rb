class DropIdentityTable < ActiveRecord::Migration[4.2]
  def change
    drop_table :identities
  end
end

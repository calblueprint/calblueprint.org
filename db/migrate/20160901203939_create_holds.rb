class CreateHolds < ActiveRecord::Migration
  def change
    create_table :holds do |t|
      t.timestamps

      t.integer :left_id, null: false
      t.integer :right_id, null: false
      t.integer :admin_id, null: false
    end

    add_index :holds, :left_id
    add_index :holds, :right_id
    add_index :holds, :admin_id
  end
end

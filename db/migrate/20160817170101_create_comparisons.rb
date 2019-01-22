class CreateComparisons < ActiveRecord::Migration[4.2]
  def change
    create_table :comparisons do |t|
      t.timestamps

      t.integer :winner_id, null: false
      t.integer :loser_id, null: false
      t.integer :admin_id, null: false
    end

    add_index :comparisons, :winner_id
    add_index :comparisons, :loser_id
    add_index :comparisons, :admin_id
  end
end

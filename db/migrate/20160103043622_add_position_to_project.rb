class AddPositionToProject < ActiveRecord::Migration[4.2]
  def change
    add_column :projects, :position, :integer
    add_index :projects, :position
  end
end

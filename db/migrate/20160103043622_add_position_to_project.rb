class AddPositionToProject < ActiveRecord::Migration
  def change
    add_column :projects, :position, :integer
    add_index :projects, :position
  end
end

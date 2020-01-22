class CreateEthnicities < ActiveRecord::Migration[5.2]
  def change
    create_table :ethnicities do |t|
      t.string :name
      t.integer :group, default: 0

      t.timestamps
    end
  end
end

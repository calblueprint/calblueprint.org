class AddChoicesToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :choices, :string
  end
end

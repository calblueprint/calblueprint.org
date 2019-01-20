class AddPlaceholderToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :placeholder, :string
  end
end

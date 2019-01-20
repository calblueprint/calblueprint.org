class AddTagToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :tag, :string
  end
end

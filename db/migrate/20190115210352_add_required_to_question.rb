class AddRequiredToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :required, :boolean, default: true
  end
end

class AddCurrentUntilToHold < ActiveRecord::Migration[4.2]
  def change
    add_column :holds, :current_until, :datetime
  end
end

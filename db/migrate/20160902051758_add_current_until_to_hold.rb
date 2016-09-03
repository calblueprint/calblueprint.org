class AddCurrentUntilToHold < ActiveRecord::Migration
  def change
    add_column :holds, :current_until, :datetime
  end
end

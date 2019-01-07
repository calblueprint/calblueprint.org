class AddCs169BooleanToNonprofitApplication < ActiveRecord::Migration[4.2]
  def change
    add_column :nonprofit_applications, :cs169_pool, :boolean
  end
end

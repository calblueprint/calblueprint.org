class AddCs169BooleanToNonprofitApplication < ActiveRecord::Migration
  def change
    add_column :nonprofit_applications, :cs169_pool, :boolean
  end
end

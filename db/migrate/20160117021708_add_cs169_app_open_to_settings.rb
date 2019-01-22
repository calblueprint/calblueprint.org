class AddCs169AppOpenToSettings < ActiveRecord::Migration[4.2]
  def change
    add_column :settings, :cs169_app_open, :bool
  end
end

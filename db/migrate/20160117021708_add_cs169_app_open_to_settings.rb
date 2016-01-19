class AddCs169AppOpenToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :cs169_app_open, :bool
  end
end

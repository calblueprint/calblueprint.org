class AddExternalAppOpenToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :external_app_open, :boolean, default: true
  end
end

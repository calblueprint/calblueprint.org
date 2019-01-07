class AddExternalAppOpenToSettings < ActiveRecord::Migration[4.2]
  def change
    add_column :settings, :external_app_open, :boolean, default: true
  end
end

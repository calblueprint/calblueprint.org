class AddNotifyBarAdminsOnlyToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :notify_bar_admins_only, :boolean, default: false
  end
end

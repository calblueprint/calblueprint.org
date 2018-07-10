class AddNotifyBarToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :notify_bar_active, :boolean
    add_column :settings, :notify_bar_content, :text
    add_column :settings, :notify_bar_link, :string
  end
end

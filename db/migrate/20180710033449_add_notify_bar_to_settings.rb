class AddNotifyBarToSettings < ActiveRecord::Migration[4.2]
  def change
    add_column :settings, :notify_bar_active, :boolean
    add_column :settings, :notify_bar_content, :text
    add_column :settings, :notify_bar_link, :string
  end
end

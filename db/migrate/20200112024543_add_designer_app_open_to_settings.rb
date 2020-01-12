class AddDesignerAppOpenToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :designer_app_open, :integer, default: 0
    rename_column :settings, :student_app_open, :dev_app_open
  end
end

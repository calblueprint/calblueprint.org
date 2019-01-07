class AddPurposeToNonprofitApplication < ActiveRecord::Migration[4.2]
  def change
    add_column :nonprofit_applications, :purpose, :text
  end
end

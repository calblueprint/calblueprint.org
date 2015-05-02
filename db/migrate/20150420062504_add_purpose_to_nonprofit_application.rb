class AddPurposeToNonprofitApplication < ActiveRecord::Migration
  def change
    add_column :nonprofit_applications, :purpose, :text
  end
end

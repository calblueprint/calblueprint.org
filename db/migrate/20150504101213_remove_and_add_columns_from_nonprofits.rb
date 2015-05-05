class RemoveAndAddColumnsFromNonprofits < ActiveRecord::Migration
  def change
    remove_column :nonprofits, :name, :string
    remove_column :nonprofits, :address, :string
    remove_column :nonprofits, :phone_number, :string
    add_column :nonprofits, :organization_name, :string
  end
end

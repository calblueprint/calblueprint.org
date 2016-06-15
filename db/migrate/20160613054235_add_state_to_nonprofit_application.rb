class AddStateToNonprofitApplication < ActiveRecord::Migration
  def change
    add_column :nonprofit_applications, :state, :string, null: false, default: 'draft'
  end
end

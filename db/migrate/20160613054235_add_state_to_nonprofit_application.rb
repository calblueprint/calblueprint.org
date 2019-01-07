class AddStateToNonprofitApplication < ActiveRecord::Migration[4.2]
  def change
    add_column :nonprofit_applications, :state, :string, null: false, default: 'draft'
  end
end

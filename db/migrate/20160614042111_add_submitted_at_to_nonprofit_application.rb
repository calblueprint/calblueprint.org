class AddSubmittedAtToNonprofitApplication < ActiveRecord::Migration[4.2]
  def change
    add_column :nonprofit_applications, :submitted_at, :datetime
  end
end

class AddSubmittedAtToNonprofitApplication < ActiveRecord::Migration
  def change
    add_column :nonprofit_applications, :submitted_at, :datetime
  end
end

class AddColumnsToNonprofitApplications < ActiveRecord::Migration
  def change
    add_column :nonprofit_applications, :history, :text
    add_column :nonprofit_applications, :date_established, :date
    add_column :nonprofit_applications, :legal, :boolean
    add_column :nonprofit_applications, :short_summary, :string
    add_column :nonprofit_applications, :goals, :text
    add_column :nonprofit_applications, :key_features, :text
    add_column :nonprofit_applications, :devices, :string
    add_column :nonprofit_applications, :target_audience, :text
    add_column :nonprofit_applications, :why, :text
  end
end

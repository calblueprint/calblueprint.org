class ChangeShortSummaryOnNonprofitApplicationFromStringToText < ActiveRecord::Migration[4.2]
  def up
    change_column :nonprofit_applications, :short_summary, :text, :limit => nil
  end

  def down
    change_column :nonprofit_applications, :short_summary, :string
  end
end

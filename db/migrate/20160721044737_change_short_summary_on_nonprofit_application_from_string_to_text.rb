class ChangeShortSummaryOnNonprofitApplicationFromStringToText < ActiveRecord::Migration
  def up
    change_column :nonprofit_applications, :short_summary, :text, :limit => nil
  end

  def down
    change_column :nonprofit_applications, :short_summary, :string
  end
end

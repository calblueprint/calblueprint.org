class AddCs169ColumnsToApplication < ActiveRecord::Migration
  def change
    add_column :nonprofit_applications, :client_status, :string
    add_column :nonprofit_applications, :technical_requirements, :text
  end
end

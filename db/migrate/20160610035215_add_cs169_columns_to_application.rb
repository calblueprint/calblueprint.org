class AddCs169ColumnsToApplication < ActiveRecord::Migration[4.2]
  def change
    add_column :nonprofit_applications, :client_status, :string
    add_column :nonprofit_applications, :technical_requirements, :text
  end
end

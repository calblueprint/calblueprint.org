class AddInfosessionToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :infosession_open, :bool, default: false
    add_column :settings, :infosession_link_one, :string, default: ""
    add_column :settings, :infosession_date_one, :datetime
    add_column :settings, :infosession_link_two, :string, default: ""
    add_column :settings, :infosession_date_two, :datetime
  end
end

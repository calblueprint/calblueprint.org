class AddInfosessionToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :infosession_one, :bool, default: false
    add_column :settings, :infosession_one_link, :string, default: ""
    add_column :settings, :infosession_one_date, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    add_column :settings, :infosession_two, :bool, default: false
    add_column :settings, :infosession_two_link, :string, default: ""
    add_column :settings, :infosession_two_date, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end

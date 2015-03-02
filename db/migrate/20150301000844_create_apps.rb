class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.timestamps

      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :year
    end
  end
end

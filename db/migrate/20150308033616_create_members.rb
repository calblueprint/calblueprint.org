class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.timestamps

      t.string :last_name
      t.string :first_name
      t.string :email
    end
  end
end

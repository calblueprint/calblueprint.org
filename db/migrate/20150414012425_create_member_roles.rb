class CreateMemberRoles < ActiveRecord::Migration[4.2]
  def change
    create_table :member_roles do |t|
      t.timestamps

      t.string :role
    end
  end
end

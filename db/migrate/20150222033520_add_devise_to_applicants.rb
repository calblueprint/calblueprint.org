class AddDeviseToApplicants < ActiveRecord::Migration
  def change
    change_table(:applicants) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Rememberable
      t.datetime :remember_created_at
    end

    add_index :applicants, :email, unique: true
  end
end

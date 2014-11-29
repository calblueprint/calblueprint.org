class CreateContactForms < ActiveRecord::Migration
  def change
    create_table :contact_forms do |t|
      t.timestamps

      t.string :name
      t.string :email
      t.string :subject
      t.string :message
    end
  end
end

class CreateNonprofitInterestForms < ActiveRecord::Migration[4.2]
  def change
    create_table :nonprofit_interest_forms do |t|
      t.string :contact_name
      t.string :phone
      t.string :role
      t.decimal :office_lat
      t.decimal :office_lng
      t.text :org_description
      t.string :website
      t.string :category
      t.boolean :agree_to_terms
      t.integer :nonprofit_id
      t.integer :semester_id

      t.timestamps null: false
    end
  end
end

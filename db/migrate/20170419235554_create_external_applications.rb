class CreateExternalApplications < ActiveRecord::Migration[4.2]
  def change
    create_table :external_applications do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :applicant_id
      t.integer :semester_id
      t.boolean :operations
      t.boolean :content
      t.boolean :design
      t.boolean :available_for_bp_games
      t.boolean :available_for_retreat
      t.boolean :applied_before
      t.text :why_no_bp_games
      t.text :why_no_retreat
      t.text :why_join
      t.text :design_experience
      t.text :experience
      t.string :website
      t.string :year
      t.string :major

      t.timestamps null: false
    end
  end
end

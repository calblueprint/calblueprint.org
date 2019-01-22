class CreateNonprofitApplications < ActiveRecord::Migration[4.2]
  def change
    create_table :nonprofit_applications do |t|
      t.integer :nonprofit_id
      t.integer :semester_id

      t.timestamps
    end
  end
end

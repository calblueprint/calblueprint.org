class CreateNonprofitApplications < ActiveRecord::Migration
  def change
    create_table :nonprofit_applications do |t|
      t.integer :nonprofit_id
      t.integer :semester_id

      t.timestamps
    end
  end
end

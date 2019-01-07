class CreateApplicants < ActiveRecord::Migration[4.2]
  def change
    create_table :applicants do |t|
      t.timestamps

      t.string :name
    end
  end
end

class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.timestamps

      t.string :name
    end
  end
end

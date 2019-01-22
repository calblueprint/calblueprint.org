class CreateSettings < ActiveRecord::Migration[4.2]
  def change
    create_table :settings do |t|
      t.timestamps

      t.string :current_semester
      t.string :npo_status
      t.string :student_status
    end
  end
end

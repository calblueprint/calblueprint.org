class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.timestamps

      t.string :current_semester
      t.string :npo_status
      t.string :student_status
    end
  end
end

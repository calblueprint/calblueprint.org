class CreateSemesters < ActiveRecord::Migration[4.2]
  def change
    create_table :semesters do |t|
      t.timestamps

      t.string :season
      t.string :year
    end
  end
end

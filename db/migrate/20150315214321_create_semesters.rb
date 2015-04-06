class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.timestamps

      t.string :season
      t.string :year
    end
  end
end

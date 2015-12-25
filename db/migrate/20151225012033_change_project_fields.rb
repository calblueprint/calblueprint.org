class ChangeProjectFields < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.remove :overview
      t.remove :problem
      t.remove :solution
      t.remove :semester_id

      t.text :full_description
    end
  end
end

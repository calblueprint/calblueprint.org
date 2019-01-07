class AddCurrentSemesterColumn < ActiveRecord::Migration[4.2]
  def change
    add_column :semesters, :is_current_semester, :boolean, default: false
  end
end

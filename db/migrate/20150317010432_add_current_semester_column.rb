class AddCurrentSemesterColumn < ActiveRecord::Migration
  def change
    add_column :semesters, :is_current_semester, :boolean, default: false
  end
end

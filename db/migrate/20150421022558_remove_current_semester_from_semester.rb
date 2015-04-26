class RemoveCurrentSemesterFromSemester < ActiveRecord::Migration
  def change
    remove_column :semesters, :is_current_semester, :boolean
  end
end

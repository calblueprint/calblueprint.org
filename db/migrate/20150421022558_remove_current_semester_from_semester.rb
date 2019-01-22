class RemoveCurrentSemesterFromSemester < ActiveRecord::Migration[4.2]
  def change
    remove_column :semesters, :is_current_semester, :boolean
  end
end

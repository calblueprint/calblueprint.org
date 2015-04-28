class SwapCurrentSemesterWithCurrentSemesterId < ActiveRecord::Migration
  def change
    remove_column :settings, :current_semester, :string
    add_column :settings, :current_semester_id, :integer
    add_index :settings, :current_semester_id
  end
end

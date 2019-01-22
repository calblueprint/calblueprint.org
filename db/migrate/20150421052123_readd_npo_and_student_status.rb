class ReaddNpoAndStudentStatus < ActiveRecord::Migration[4.2]
  def change
    add_column :settings, :npo_app_open, :boolean
    add_column :settings, :student_app_open, :boolean
  end
end

class RemoveNpoAndStudentStatus < ActiveRecord::Migration
  def change
    remove_column :settings, :npo_status, :string
    remove_column :settings, :student_status, :string
  end
end

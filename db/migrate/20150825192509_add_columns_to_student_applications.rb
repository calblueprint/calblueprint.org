class AddColumnsToStudentApplications < ActiveRecord::Migration
  def change
    add_column :student_applications, :name, :string
    add_column :student_applications, :email, :string
    add_column :student_applications, :available_for_bp_games, :boolean, default: false
    add_column :student_applications, :available_for_retreat, :boolean, default: false
  end
end

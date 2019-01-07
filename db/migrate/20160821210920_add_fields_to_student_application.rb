class AddFieldsToStudentApplication < ActiveRecord::Migration[4.2]
  def up
    add_column :student_applications, :why_you, :text
    add_column :student_applications, :experience, :text
    add_column :student_applications, :projects, :text
    add_column :student_applications, :service, :text
    add_column :student_applications, :why_no_bp_games, :text
    add_column :student_applications, :why_no_retreat, :text
    add_column :student_applications, :applied_before, :boolean, default: false
    add_column :student_applications, :version, :integer, default: 2

    StudentApplication.find_each do |app|
      app.update_attribute('version', 1)
    end
  end

  def down
    remove_column :student_applications, :why_you
    remove_column :student_applications, :experience
    remove_column :student_applications, :projects
    remove_column :student_applications, :service
    remove_column :student_applications, :why_no_bp_games
    remove_column :student_applications, :why_no_retreat
    remove_column :student_applications, :applied_before
  end
end

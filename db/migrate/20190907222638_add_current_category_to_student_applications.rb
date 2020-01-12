class AddCurrentCategoryToStudentApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :student_applications, :current_category, :string
  end
end

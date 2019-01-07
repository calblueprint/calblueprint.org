class RemoveWhyYou < ActiveRecord::Migration[4.2]
  def change
    remove_column :student_applications, :why_you
  end
end

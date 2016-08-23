class RemoveWhyYou < ActiveRecord::Migration
  def change
    remove_column :student_applications, :why_you
  end
end

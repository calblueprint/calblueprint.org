class AddHardestAchievementToStudentApplications < ActiveRecord::Migration[4.2]
  def change
    add_column :student_applications, :hardest_achievement, :text
  end
end

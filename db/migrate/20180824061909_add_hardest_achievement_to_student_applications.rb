class AddHardestAchievementToStudentApplications < ActiveRecord::Migration
  def change
    add_column :student_applications, :hardest_achievement, :text
  end
end

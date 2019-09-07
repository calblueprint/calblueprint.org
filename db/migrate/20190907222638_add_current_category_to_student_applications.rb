class AddCurrentCategoryToStudentApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :student_applications, :current_category, :string

    designers = student_applications.where(application_type: "Designer")
    devs = student_applications.where.not(application_type: "Designer")

    states = ['Technical (Developer)', 'Learning Speed/Independence (Always Innovate)', 'Culture (Mission First)', 'Culture (Be Humble)']

    designers.shuffle.in_groups(3).each_with_index do |group, i|
      group.each do |applicant|
        applicant.current_category = states[i+1]
        applicant.save!
      end
    end

    devs.shuffle.in_groups(4).each_with_index do |group, i|
      group.each do |applicant|
        applicant.current_category = states[i]
        applicant.save!
      end
    end
  end
end

class AddCurrentCategoryToStudentApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :student_applications, :current_category, :string

    student_applications = StudentApplication.where semester: Settings.instance.current_semester
    designers = student_applications.select {|a| a.response_to('application_type') == 'Designer'}
    devs = student_applications.select {|a| a.response_to('application_type') != 'Designer'}

    states = ['Technical (Developer)', 'Learning Speed/Independence (Always Innovate)', 'Culture (Mission First)', 'Culture (Be Humble)']

    designers.shuffle.in_groups(3, false).each_with_index do |group, i|
      group.each do |applicant|
        applicant.current_category = states[i+1]
        applicant.save!
      end
    end
    puts "Finished Updating #{designers.count} Designers"

    devs.shuffle.in_groups(4, false).each_with_index do |group, i|
      group.each do |applicant|
        applicant.current_category = states[i]
        applicant.save!
      end
    end
    puts "Finished Updating #{devs.count} Developers"
  end
end

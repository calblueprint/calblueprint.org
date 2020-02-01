STATES = ['Learning Speed/Independence (Always Innovate)', 'Culture (Mission First)', 'Culture (Be Humble)'].freeze
# 'Technical (Developer)'
namespace :students do
  desc "Shuffle current category for each applicant to be run before starting comparisons"
  task comparison: :environment do
    student_applications = StudentApplication.where semester: Settings.instance.current_semester
    designers = student_applications.select {|a| a.response_to('application_type') == 'Designer'}
    devs = student_applications.select {|a| a.response_to('application_type') != 'Designer'}

    # designers.shuffle.in_groups(3, false).each_with_index do |group, i|
    #   group.each do |applicant|
    #     applicant.current_category = STATES[i]
    #     applicant.save!
    #   end
    # end
    # puts "Finished Updating #{designers.count} Designers"

    devs.shuffle.in_groups(3, false).each_with_index do |group, i|
      group.each do |applicant|
        applicant.current_category = STATES[i]
        applicant.save!
      end
    end
    puts "Finished Updating #{devs.count} Developers"
  end
end

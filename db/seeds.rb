# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# def seed_semesters
#   Semester.find_or_create_by! season: 'spring', year: '2019'
# end

# def seed_questions
#   Question.find_or_create_by! tag: :name,
#                               title: "What's your name?",
#                               hint: "No hint",
#                               question_category: 0,
#                               question_type: 0,
#                               required: true
#   Question.find_or_create_by! tag: :why_join,
#                               title: "Why are you here?",
#                               hint: "",
#                               question_category: 0,
#                               question_type: 1,
#                               required: true
#   Question.find_or_create_by! tag: :year,
#                               title: "What year are you?",
#                               hint: "graduate students only",
#                               question_category: 0,
#                               question_type: 0,
#                               required: true
# end

# QuestionSemester.destroy_all
# Semester.destroy_all
# Question.destroy_all
# seed_semesters
# seed_questions

# QuestionSemester.create! question: Question.first, semester: Semester.first, question_order: 5
# QuestionSemester.create! question: Question.second, semester: Semester.first, question_order: 3
# QuestionSemester.create! question: Question.third, semester: Semester.first, question_order: 2




def seed_admins
  Admin.create_with(password: 'password').find_or_create_by!(
    first_name: 'Blueprint', last_name: 'Admin', email: 'admin@calblueprint.org', role: "super_admin"
  )
end
#
# def seed_semesters
#   Semester.find_or_create_by! season: 'spring', year: '2013'
# end
#
# def seed_applicants
#   Applicant.create_with(password: 'password').find_or_create_by!(
#     name: 'Applicant1', email: 'kevin@gmail.com'
#   )
# end
#
# def seed_student_applications
#   applicant = Applicant.first
#   semester = Settings.instance.current_semester
#
#   applicant.student_applications.find_or_create_by! why_join: "I'm great",
#                                                     phone: "11",
#                                                     year: "Other",
#                                                     name: applicant.name,
#                                                     email: applicant.email,
#                                                     semester: semester,
#                                                     resume_file_name: 'test.pdf',
#                                                     resume_content_type: 'application/pdf',
#                                                     resume_file_size: 800,
#                                                     why_no_bp_games: 'because',
#                                                     why_no_retreat: 'beacuse'
# end
#
# def seed_nonprofits
#   Nonprofit.create_with(password: 'password').find_or_create_by!(
#     organization_name: 'NPO Blueprint', email: 'npo@blueprint.org'
#   )
# end
#
# def seed_nonprofit_applications
#   NonprofitApplication.find_or_create_by!(
#     purpose: "To save the world.",
#     history: "Cool history.",
#     date_established: DateTime.now.to_date,
#     legal: true,
#     short_summary: FFaker::Lorem.paragraph(2),
#     goals: FFaker::Lorem.paragraph(4),
#     key_features: FFaker::Lorem.paragraph(4),
#     devices: ["Mobile phones"],
#     target_audience: "Everyone.",
#     why: FFaker::Lorem.paragraph(4),
#     nonprofit: Nonprofit.first,
#     semester: Settings.instance.current_semester,
#     cs169_pool: true,
#     client_status: NonprofitApplication::CLIENT_STATUSES[0],
#     technical_requirements: "All the tech.",
#   )
#   NonprofitApplication.find_or_create_by!(
#     purpose: "To save the world.",
#     history: "Cool history.",
#     date_established: DateTime.now.to_date,
#     legal: true,
#     short_summary: FFaker::Lorem.paragraph(2),
#     goals: FFaker::Lorem.paragraph(4),
#     key_features: FFaker::Lorem.paragraph(4),
#     devices: ["Mobile phones"],
#     target_audience: "Everyone.",
#     why: FFaker::Lorem.paragraph(4),
#     nonprofit: Nonprofit.first,
#     semester: Settings.instance.current_semester,
#     cs169_pool: true,
#     client_status: NonprofitApplication::CLIENT_STATUSES[0],
#     technical_requirements: "All the tech.",
#   ).submit
# end
#
# def seed_projects
#   `rake update:projects`
# end
#
# def seed_roles_and_members
#   `rake update:members`
# end
#
seed_admins
# seed_semesters
# seed_applicants
# seed_student_applications
# seed_nonprofits
# seed_nonprofit_applications
# seed_projects
# seed_roles_and_members

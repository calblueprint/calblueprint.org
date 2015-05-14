# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seed_admins
  Admin.create_with(password: 'password').find_or_create_by!(
    first_name: 'Blueprint', last_name: 'Admin', email: 'admin@calblueprint.org'
  )
end

def seed_semesters
  Semester.find_or_create_by! season: 'spring', year: '2013'
end

def seed_applicants
  Applicant.create_with(password: 'password').find_or_create_by!(
    name: 'Applicant1', email: 'kevin@gmail.com'
  )
end

def seed_student_applications
  applicant = Applicant.first
  semester = Settings.instance.current_semester

  applicant.student_applications.find_or_create_by! why_join: "I'm great",
                                                    phone: "11",
                                                    year: "Other",
                                                    semester: semester,
                                                    resume_file_name: 'test.pdf',
                                                    resume_content_type: 'application/pdf',
                                                    resume_file_size: 800
  applicant.student_applications.find_or_create_by! why_join: "I'm great",
                                                    phone: "22",
                                                    year: "Senior",
                                                    semester: semester,
                                                    resume_file_name: 'test.pdf',
                                                    resume_content_type: 'application/pdf',
                                                    resume_file_size: 800
end

def seed_nonprofits
  Nonprofit.create_with(password: 'password').find_or_create_by!(
    organization_name: 'Nonprofit Blueprint', email: 'nonprofitblueprint@gmail.com'
  )
end

# TODO: Seed NPO apps

def seed_roles_and_members
  president_role = MemberRole.find_or_create_by! role: "President"
  internal_role = MemberRole.find_or_create_by! role: "Internal VP"
  external_role = MemberRole.find_or_create_by! role: "External VP"
  tech_role = MemberRole.find_or_create_by! role: "VP of Technology"
  projects_role = MemberRole.find_or_create_by! role: "VP of Projects"
  leader_role = MemberRole.find_or_create_by! role: "Project Leader"
  developer_role = MemberRole.find_or_create_by! role: "Project Developer"
  alumni_relations_role = MemberRole.find_or_create_by! role: "Alumni Relations Director"
  community_role = MemberRole.find_or_create_by! role: "Community Outreach Director"
  intersocietal_role = MemberRole.find_or_create_by! role: "Intersocietal Relations Director"
  media_role = MemberRole.find_or_create_by! role: "Media Director"
  corporate_role = MemberRole.find_or_create_by! role: "Corporate Relations Director"
  alumnus_role = MemberRole.find_or_create_by! role: "Alumnus"

  Member.find_or_create_by! first_name: 'Jessica', last_name: 'Lin', email: 'heyjaylin@gmail.com',
                            member_role: president_role
  Member.find_or_create_by! first_name: 'Sam', last_name: 'Lau', email: 'samlau95@gmail.com',
                            member_role: tech_role
  Member.find_or_create_by! first_name: 'Howard', last_name: 'Chen', email: 'howardxchen@gmail.com',
                            member_role: internal_role
  Member.find_or_create_by! first_name: 'Vivek', last_name: 'Raghuram', email: 'vv9295@yahoo.com',
                            member_role: external_role
  Member.find_or_create_by! first_name: 'Alice', last_name: 'Oh', email: 'missonederland@gmail.com',
                            member_role: alumnus_role
  Member.find_or_create_by! first_name: 'Eric', last_name: 'Shen', email: 'email.ericshen@gmail.com',
                            member_role: developer_role
  Member.find_or_create_by! first_name: 'Nikhil', last_name: 'Narayen', email: 'nikhil.narayen@gmail.com',
                            member_role: developer_role
  Member.find_or_create_by! first_name: 'Byron', last_name: 'Zhang', email: 'byron.yi.zhang@gmail.com',
                            member_role: leader_role
  Member.find_or_create_by! first_name: 'Harrison', last_name: 'Tsai', email: 'harrisontsai0123@gmail.com',
                            member_role: alumnus_role
  Member.find_or_create_by! first_name: 'Erica', last_name: 'Yin', email: 'eriicaericaerica@gmail.com',
                            member_role: developer_role
  Member.find_or_create_by! first_name: 'Soo', last_name: 'Song', email: 'soosong@berkeley.edu',
                            member_role: media_role
  Member.find_or_create_by! first_name: 'Quinton', last_name: 'Dang', email: 'quintonddang@gmail.com',
                            member_role: developer_role
  Member.find_or_create_by! first_name: 'Max', last_name: 'Wolffe', email: 'max.alan.wolffe@gmail.com',
                            member_role: developer_role
  Member.find_or_create_by! first_name: 'Kevin', last_name: 'Shieh', email: 'kevshieh@gmail.com',
                            member_role: developer_role
  Member.find_or_create_by! first_name: 'Warren', last_name: 'Shen', email: 'warrenzshen@gmail.com',
                            member_role: developer_role
  Member.find_or_create_by! first_name: 'Will', last_name: 'Tang', email: 'williamctang93@gmail.com',
                            member_role: developer_role
  Member.find_or_create_by! first_name: 'Aleks', last_name: 'Kamko', email: 'aykamko@gmail.com',
                            member_role: developer_role
  Member.find_or_create_by! first_name: 'Varun', last_name: 'Rau', email: 'varun@berkeley.edu',
                            member_role: leader_role
  Member.find_or_create_by! first_name: 'Nishant', last_name: 'Desai', email: 'nish.sdesai@gmail.com',
                            member_role: leader_role
  Member.find_or_create_by! first_name: 'Jordeen', last_name: 'Chang', email: 'jordeenchang@gmail.com',
                            member_role: developer_role
  Member.find_or_create_by! first_name: 'Sameera', last_name: 'Vemulapalli', email: 'sameera.vemulapalli@gmail.com',
                            member_role: developer_role
  Member.find_or_create_by! first_name: 'Ethan', last_name: 'Chiou', email: 'nahte.uoihc@gmail.com',
                            member_role: developer_role
  Member.find_or_create_by! first_name: 'Atsunori', last_name: 'Kakitani', email: 'atsunori.kakitani@gmail.com',
                            member_role: developer_role
  Member.find_or_create_by! first_name: 'Elizabeth', last_name: 'Lin', email: 'elizabethylin@gmail.com',
                            member_role: alumnus_role
  Member.find_or_create_by! first_name: 'Andy', last_name: 'Qin', email: 'andrewlqin@gmail.com',
                            member_role: developer_role
  Member.find_or_create_by! first_name: 'Jason', last_name: 'Won', email: 'jason.j.won@gmail.com',
                            member_role: leader_role
  Member.find_or_create_by! first_name: 'Daniel', last_name: 'Li', email: 'danielmxli@gmail.com',
                            member_role: developer_role
end

seed_admins
seed_semesters
seed_applicants
seed_student_applications
seed_nonprofits
seed_roles_and_members

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create! first_name: 'Sam', last_name: 'Admin', email: 'sam@admin.com', password: 'password'

applicant = Applicant.create! name: 'Applicant1', email: 'kevin@gmail.com', password: 'password'

applicant.student_applications.create! why_join: "I'm great",
                                       phone: "11",
                                       year: "Other",
                                       semester: semester,
                                       resume_file_name: 'test.pdf',
                                       resume_content_type: 'application/pdf',
                                       resume_file_size: 800
applicant.student_applications.create! why_join: "I'm great",
                                       phone: "22",
                                       year: "Senior",
                                       semester: semester,
                                       resume_file_name: 'test.pdf',
                                       resume_content_type: 'application/pdf',
                                       resume_file_size: 800

# Update with nonprofit/apps seeds
Nonprofit.create! organization_name: 'Nonprofit Blueprint', email: 'nonprofitblueprint@gmail.com',
                  password: 'password'
Nonprofit.create! organization_name: 'Nonprofit Worldreader', email: 'nonprofitworldreader@gmail.com',
                  password: 'password'
# TODO: Seed NPO apps

# Create roles
president_role = MemberRole.create! role: "President"
internal_role = MemberRole.create! role: "Internal VP"
external_role = MemberRole.create! role: "External VP"
tech_role = MemberRole.create! role: "VP of Technology"
projects_role = MemberRole.create! role: "VP of Projects"
leader_role = MemberRole.create! role: "Project Leader"
developer_role = MemberRole.create! role: "Project Developer"
alumni_relations_role = MemberRole.create! role: "Alumni Relations Director"
community_role = MemberRole.create! role: "Community Outreach Director"
intersocietal_role = MemberRole.create! role: "Intersocietal Relations Director"
media_role = MemberRole.create! role: "Media Director"
corporate_role = MemberRole.create! role: "Corporate Relations Director"
alumnus_role = MemberRole.create! role: "Alumnus"

# Seed all members with current roles
Member.create! first_name: 'Jessica', last_name: 'Lin', email: 'heyjaylin@gmail.com',
               member_role: president_role
Member.create! first_name: 'Sam', last_name: 'Lau', email: 'samlau95@gmail.com',
               member_role: tech_role
Member.create! first_name: 'Howard', last_name: 'Chen', email: 'howardxchen@gmail.com',
               member_role: internal_role
Member.create! first_name: 'Vivek', last_name: 'Raghuram', email: 'vv9295@yahoo.com',
               member_role: external_role
Member.create! first_name: 'Alice', last_name: 'Oh', email: 'missonederland@gmail.com',
               member_role: alumnus_role
Member.create! first_name: 'Eric', last_name: 'Shen', email: 'email.ericshen@gmail.com',
               member_role: developer_role
Member.create! first_name: 'Nikhil', last_name: 'Narayen', email: 'nikhil.narayen@gmail.com',
               member_role: developer_role
Member.create! first_name: 'Byron', last_name: 'Zhang', email: 'byron.yi.zhang@gmail.com',
               member_role: leader_role
Member.create! first_name: 'Harrison', last_name: 'Tsai', email: 'harrisontsai0123@gmail.com',
               member_role: alumnus_role
Member.create! first_name: 'Erica', last_name: 'Yin', email: 'eriicaericaerica@gmail.com',
               member_role: developer_role
Member.create! first_name: 'Soo', last_name: 'Song', email: 'soosong@berkeley.edu',
               member_role: media_role
Member.create! first_name: 'Quinton', last_name: 'Dang', email: 'quintonddang@gmail.com',
               member_role: developer_role
Member.create! first_name: 'Max', last_name: 'Wolffe', email: 'max.alan.wolffe@gmail.com',
               member_role: developer_role
Member.create! first_name: 'Kevin', last_name: 'Shieh', email: 'kevshieh@gmail.com',
               member_role: developer_role
Member.create! first_name: 'Warren', last_name: 'Shen', email: 'warrenzshen@gmail.com',
               member_role: developer_role
Member.create! first_name: 'Will', last_name: 'Tang', email: 'williamctang93@gmail.com',
               member_role: developer_role
Member.create! first_name: 'Aleks', last_name: 'Kamko', email: 'aykamko@gmail.com',
               member_role: developer_role
Member.create! first_name: 'Varun', last_name: 'Rau', email: 'varun@berkeley.edu',
               member_role: leader_role
Member.create! first_name: 'Nishant', last_name: 'Desai', email: 'nish.sdesai@gmail.com',
               member_role: leader_role
Member.create! first_name: 'Jordeen', last_name: 'Chang', email: 'jordeenchang@gmail.com',
               member_role: developer_role
Member.create! first_name: 'Sameera', last_name: 'Vemulapalli', email: 'sameera.vemulapalli@gmail.com',
               member_role: developer_role
Member.create! first_name: 'Ethan', last_name: 'Chiou', email: 'nahte.uoihc@gmail.com',
               member_role: developer_role
Member.create! first_name: 'Atsunori', last_name: 'Kakitani', email: 'atsunori.kakitani@gmail.com',
               member_role: developer_role
Member.create! first_name: 'Elizabeth', last_name: 'Lin', email: 'elizabethylin@gmail.com',
               member_role: alumnus_role
Member.create! first_name: 'Andy', last_name: 'Qin', email: 'andrewlqin@gmail.com',
               member_role: developer_role
Member.create! first_name: 'Jason', last_name: 'Won', email: 'jason.j.won@gmail.com',
               member_role: leader_role
Member.create! first_name: 'Daniel', last_name: 'Li', email: 'danielmxli@gmail.com',
               member_role: developer_role

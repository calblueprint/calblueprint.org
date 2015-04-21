# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create! first_name: 'Sam', last_name: 'Admin', email: 'sam@admin.com', password: 'password'

role = MemberRole.create! role: "Role"
semester = Semester.create! season: 'spring', year: '2013'
applicant = Applicant.create! name: 'Applicant1', email: 'kevin@gmail.com', password: 'password'

applicant.student_applications.create! why_join: "I'm awesome"
applicant.student_applications.create! why_join: "I'm awesome"

Member.create! first_name: 'divine', last_name: 'cherry', email: 'dc@gmail.com', member_role: role
Member.create! first_name: 'withered', last_name: 'wind', email: 'ww@gmail.com', member_role: role
Member.create! first_name: 'holy', last_name: 'breeze', email: 'hb@gmail.com', member_role: role

Settings.create! current_semester_id: 1, npo_app_open: false, student_app_open: false, singleton_guard: 0

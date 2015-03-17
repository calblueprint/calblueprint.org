# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create! first_name: 'Sam', last_name: 'Admin', email: 'sam@admin.com', password: 'password'

semester = Semester.create! season: 'spring', year: '2015', is_current_semester: true

applicant = Applicant.create! name: 'Applicant1', email: 'kevin@gmail.com', password: 'password'

applicant.apps.create! semester: semester
applicant.apps.create! semester: semester

Member.create! first_name: 'divine', last_name: 'cherry', email: 'dc@gmail.com'
Member.create! first_name: 'withered', last_name: 'wind', email: 'ww@gmail.com'
Member.create! first_name: 'holy', last_name: 'breeze', email: 'hb@gmail.com'

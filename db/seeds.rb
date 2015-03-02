# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create! first_name: 'Sam', last_name: 'Admin', email: 'sam@admin.com', password: 'password'

applicant = Applicant.create! name: 'Applicant1', email: 'kevin@gmail.com', password: 'password'

applicant.apps.create! year: '2015'
applicant.apps.create! year: '1999'

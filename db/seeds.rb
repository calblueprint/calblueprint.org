# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! first_name: 'Sam', last_name: 'Applicant', email: 'sam@applicant.com',
             password: 'password', role: User.roles[:applicant]

User.create! first_name: 'Sam', last_name: 'Member', email: 'sam@member.com',
             password: 'password', role: User.roles[:member]

User.create! first_name: 'Sam', last_name: 'Admin', email: 'sam@admin.com',
             password: 'password', role: User.roles[:admin]

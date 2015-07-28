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
end

def seed_nonprofits
  Nonprofit.create_with(password: 'password').find_or_create_by!(
    organization_name: 'NPO Blueprint', email: 'npo@blueprint.org'
  )
end

def seed_nonprofit_applications
  NonprofitApplication.find_or_create_by!(
    purpose: "To save the world.",
    history: "Cool history.",
    date_established: DateTime.now.to_date,
    legal: true,
    short_summary: FFaker::Lorem.paragraph(2),
    goals: FFaker::Lorem.paragraph(4),
    key_features: FFaker::Lorem.paragraph(4),
    devices: ["Mobile phones"],
    target_audience: "Everyone.",
    why: FFaker::Lorem.paragraph(4),
    nonprofit: Nonprofit.first,
    semester: Settings.instance.current_semester
  )
end

def seed_roles_and_members
  roles_hash = {}
  member_info = YAML::load_file(File.join(__dir__, "members.yml"))
  member_info.each do |k, v|
  member_info.values.each do |member_attributes|
    if member_attributes.has_key? 'first_name'
      member = Member.find_or_create_by! email: member_attributes["email"]
      member_role = member_attributes["role"]
      if !roles_hash.has_key? member_role
        roles_hash[member_role] = MemberRole.find_or_create_by! role: member_role
      end
      member_role = roles_hash[member_role]
      member.update(member_role: member_role)
    end 
  end
end

seed_admins
seed_semesters
seed_applicants
seed_student_applications
seed_nonprofits
seed_nonprofit_applications
seed_roles_and_members


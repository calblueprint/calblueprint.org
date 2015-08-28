namespace :update do
  desc 'Updates our members to match our yml file'
  task members: :environment do
    members_and_roles = YAML.load_file(Rails.root.join('db', 'members.yml'))
    members_and_roles["roles"].each do |_, role_data|
      MemberRole.find_or_create_by! role_data
    end
    members_and_roles["members"].each do |_, member_data|
      role_data = member_data.delete 'role'
      is_alumnus = member_data.key?('is_alumnus') && member_data.delete('is_alumnus')
      role = MemberRole.find_by role: role_data
      member = Member.find_or_initialize_by member_data
      member.update! member_role: role, is_alumnus: is_alumnus
    end
  end
end

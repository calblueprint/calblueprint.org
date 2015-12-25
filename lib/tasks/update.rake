namespace :update do
  desc 'Updates our members to match our yml file'
  task members: :environment do
    members_and_roles = YAML.load_file(Rails.root.join('data', 'members.yml'))
    members_and_roles["roles"].each do |_, role_data|
      MemberRole.find_or_create_by! role_data
    end
    members_and_roles["members"].each do |member_data|
      role_data = member_data.delete 'role'
      is_alumnus = member_data.key?('is_alumnus') && member_data.delete('is_alumnus')
      role = MemberRole.find_by role: role_data
      member = Member.find_or_initialize_by member_data
      member.update! member_role: role, is_alumnus: is_alumnus
    end
  end

  desc 'Updates projects to match the data/project.yml file'
  task projects: :environment do
    projects = YAML.load_file Rails.root.join 'data', 'projects.yml'
    projects.each do |project|
      # The project object contains a banner_image key that has the URL of the
      # image for a particular project. Normally, we could just do
      # Project.create(project) and have the banner_image set properly because
      # of Paperclip. However, since banner_image isn't an actual column in the
      # DB, trying to find_by with that key results in an error. The following
      # bit of code gets around that by excluding the key then setting it
      # manually.
      without_banner_image = project.reject { |k| k == 'banner_image' }
      Project.find_or_create_by!(without_banner_image) do |p|
        p.banner_image = project['banner_image']
      end
    end
  end
end

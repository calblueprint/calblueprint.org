# rake db:seed:questions
namespace :db do
  namespace :seed do
    desc "Seed Questions from /db/seeds/ethnicities.yml"
    task :ethnicities => :environment do
      db_seed_ethnicities
    end
  end
end

# Seed multiple ethnicities by loading the YAML file
def db_seed_ethnicities
  path = Rails.root.join('db','seeds','ethnicities.yml')
  File.open(path) do |file|
    # puts "Seeding App Ethnicities from #{path}"
    YAML.load_stream(file) do |doc|
      doc.keys.each do |group|
        # puts "Seeding ethnicity with group #{group}"
        names = doc[group]
        names.each do |name|
          db_seed_ethnicity(group, name)
        end
      end
    end
  end
end

def db_seed_ethnicity(group, name)
  ethnicity = Ethnicity.where(group: group, name: name).first_or_create
  if not ethnicity
    puts "Couldn't create ethnicity with name #{name} under group #{group} while seeding ethnicities"
  end
end

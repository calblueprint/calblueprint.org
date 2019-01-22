# rake db:seed:questions
namespace :db do
  namespace :seed do
    desc "Seed Questions from /db/seeds/questions.yml"
    task :questions => :environment do
      db_seed_questions
    end
  end
end

# Seed multiple questions by loading the YAML file
def db_seed_questions
  path = Rails.root.join('db','seeds','questions.yml')
  File.open(path) do |file|
    # puts "Seeding App Questions from #{path}"
    YAML.load_documents(file) do |doc|
      doc.keys.sort.each do |tag|
        # puts "Seeding question with tag #{tag}"
        attributes = doc[tag]
        db_seed_question(tag, attributes)
      end
    end
  end
end

def db_seed_question(tag, attributes)
  question = Question.where(tag: tag).first_or_create
  if question
    question.update!(attributes)
    # update the user with user.update(name: attributes['name'])
  else
    puts "Couldn't create question with tag #{tag} while seeding questions"
  end
end

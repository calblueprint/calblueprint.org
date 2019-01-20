# rake db:seed:applications
namespace :db do
  namespace :seed do
    desc "Destructively seed application structure from /db/seeds/applications.yml"
    task :applications => :environment do
      db_seed_applications
    end
  end
end

# Seed multiple applications by loading the YAML file
def db_seed_applications
  path = Rails.root.join('db','seeds','applications.yml')
  puts "Seeding from file #{path}"
  File.open(path) do |file|
    YAML.load_documents(file) do |doc|
      doc.keys.sort.each do |key|
        puts "Seeding application structure #{key}"
        puts "Warning this will delete the existing application structure for this semester"
        attributes = doc[key]
        db_seed_application(attributes)
      end
    end
  end
end

def db_seed_application(attributes)
  semester = Semester.where(season: attributes['season'], year: attributes['year']).first_or_create
  QuestionSemester.where(semester: semester).destroy_all
  # Find valid questions
  questions = []
  attributes['questions'].each do |q|
    question = Question.find_by(tag: q)
    if question
      questions.push question
    else
      puts "Could not find question with tag #{q}"
    end
  end
  # Create QuestionSemester objects for valid questions
  questions.each_with_index {|q, i| QuestionSemester.create! question: q, semester: semester, question_order: i}
end

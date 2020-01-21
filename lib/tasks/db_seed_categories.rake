# rake db:seed:categories
namespace :db do
  namespace :seed do
    desc "Destructively seed category structure from /db/seeds/categories.yml"
    task :categories => :environment do
      db_seed_categories
    end
  end
end

# Seed multiple categories by loading the YAML file
def db_seed_categories
  path = Rails.root.join('db','seeds','categories.yml')
  File.open(path) do |file|
    YAML.load_stream(file) do |doc|
      doc.keys.sort.each do |key|
        # puts "Seeding comparison category structure #{key}"
        # puts "Warning this will delete any comparison category <-> question relationships existing for any duplicate categories"
        attributes = doc[key]
        db_seed_category(attributes)
      end
    end
  end
end

def db_seed_category(attributes)
  category = ComparisonCategory.where(name: attributes['name']).first_or_create
  category.update!(
    comparison_bonus: attributes['bonus'],
    comparison_penalty: attributes['penalty'],
    weight: attributes['weight'],
    application_types: attributes['filter'],
    semester: Settings.instance.current_semester
  )
  ComparisonCategoryQuestion.where(comparison_category: category).destroy_all

  # Find valid questions
  questions = []
  attributes['questions'].each do |q|
    question = Question.find_by(tag: q)
    if question
      questions.push question
    else
      puts "Could not find question with tag #{q} while seeding categories"
    end
  end
  # Create QuestionSemester objects for valid questions
  questions.each {|q| ComparisonCategoryQuestion.create! question: q, comparison_category: category}
end

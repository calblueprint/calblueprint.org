# Makes sure at least one semester and one settings model is in the system
# before the app starts.
class SeedQuestionData
  class << self
    def execute
      Rails.application.load_tasks
      Rake::Task["db:seed:questions"].invoke
      Rake::Task["db:seed:applications"].invoke
      Rake::Task["db:seed:categories"].invoke
    end
  end
end

SeedQuestionData.execute

# More info at https://github.com/guard/guard#readme

# Janky scss-lint runner. Let's replace this with a gem someday.
module ::Guard
  class ScssLint < Plugin
    def run_all(*args)
      UI.info 'Inspecting code style of all SCSS files'
      inspect_with_scss_lint
    end

    alias_method :start, :run_all
    alias_method :run_on_additions, :run_all
    alias_method :run_on_modifications, :run_all

    private

    def inspect_with_scss_lint
      passed = system('scss-lint -c .scss-lint.yml')
      throw :task_has_failed unless passed
    rescue => error
      UI.error 'The following exception occurred while running guard-scss_lint: ' \
               "#{error.backtrace.first} #{error.message} (#{error.class.name})"
    end
  end
end

# Livereload config
guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|scss|js|coffee|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
  # Decorators
  watch(%r{app/decorators/.+\.rb})
end

# Runs rspec, then rubocop
group :red_green_refactor, halt_on_fail: true do
  #  cmd option runs rspec under spring
  guard :rspec, cmd: 'bin/rspec' do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')  { "spec" }

    # Rails example
    watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
    watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
    watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
    watch('config/routes.rb')                           { "spec/routing" }
    watch('app/controllers/application_controller.rb')  { "spec/controllers" }
    watch('spec/rails_helper.rb')                       { "spec" }

    # Capybara features specs
    watch(%r{^app/views/(.+)/.*\.(erb|haml|slim)$})     { |m| "spec/features/#{m[1]}_spec.rb" }

    # Turnip features and steps
    watch(%r{^spec/acceptance/(.+)\.feature$})
    watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$})   { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance' }
  end

  guard :rubocop, cli: ['-D', '-R'] do
    # Rails example
    watch(%r{^app/(.+)\.rb$})
    watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})
    watch(%r{^app/controllers/(.+)_(controller)\.rb$})
    watch(%r{^spec/support/(.+)\.rb$})
    watch('config/routes.rb')
    watch('app/controllers/application_controller.rb')
    watch('spec/rails_helper.rb')
  end

  guard :scss_lint do
    watch(%r{^app/assets/stylesheets/(.+)\.scss$})
  end
end

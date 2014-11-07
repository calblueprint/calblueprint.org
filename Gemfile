source 'https://rubygems.org'
ruby '2.1.4'

# Core gems
gem 'rails', '4.1.7'
gem 'thin', '~> 1.6.3'
gem 'pg', '~> 0.17.1'
gem 'figaro', '~> 1.0.0'

# Components
gem 'turbolinks', '~> 2.5.1'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'devise', '~> 3.4.1'
gem 'simple_form', '~> 3.0.2'
gem 'gon', '~> 5.2.3'
gem 'kaminari', '~> 0.16.1'

# Frontend
gem 'sass-rails', '~> 4.0.3'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails', '~> 3.1.2'
gem 'uglifier', '>= 1.3.0'
gem 'slim-rails', '~> 2.1.5'
gem 'autoprefixer-rails', '~> 3.1.2'

# Analytics and error logging - requires setup with service
gem 'rollbar'
gem 'newrelic_rpm'

group :development do
  gem 'annotate'
  gem 'ffaker'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rubocop'
  gem 'guard-rubocop'
end

group :development, :test do
  gem 'awesome_print'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'guard-livereload'

  # Test gems
  gem 'rspec-rails', '~> 3.1.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'database_cleaner', '~> 1.3.0'
  gem 'capybara', '~> 2.4.4'
  gem 'launchy'
  gem 'guard-rspec'

  gem "codeclimate-test-reporter", require: nil
end

group :production do
  gem 'rails_12factor'
  gem 'heroku-deflater'
end

source 'https://rubygems.org'
ruby '2.1.4'

# Core gems
gem 'rails', '4.1.7'
gem 'thin', '~> 1.6.3'
gem 'pg', '~> 0.17.1'
gem 'figaro', '~> 1.0.0'
gem 'sucker_punch', '~> 1.3.1'
gem 'aasm', '~> 4.1.0'

# Components
gem 'turbolinks', '~> 2.5.1'
gem 'devise', '~> 3.4.1'
gem 'devise_invitable', '~> 1.4.0'
gem 'omniauth-facebook', '~> 2.0.1'
gem 'omniauth-google-oauth2', '~> 0.2.6'
gem 'cancancan', '~> 1.9.2'
gem 'simple_form', '~> 3.0.2'
gem 'gon', '~> 5.2.3'
gem 'kaminari', '~> 0.16.1'
gem 'email_validator', '~> 1.4.0'
gem 'recipient_interceptor', '~> 0.1.2'
gem 'enumerize'
gem "paperclip", "~> 4.2"
gem 'aws-sdk', '~> 1.5.7'
gem "iconv", "~> 1.0.3"
gem 'ffaker'

# Frontend
gem 'sass-rails', '~> 5.0.3'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails', '~> 3.1.2'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'
gem 'autoprefixer-rails', '~> 3.1.2'

gem 'flutie', '~> 2.0.0'
gem 'title', '~> 0.0.5'

gem 'bourbon', '~> 4.2.2'
gem 'neat', '~> 1.7.2'
gem 'bitters', '~> 1.0.0'
gem 'font-awesome-rails', '~> 4.3.0'
gem 'sky-labels-rails'

# Error logging - requires setup with service
gem 'rollbar'

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rubocop'
  gem 'guard-rubocop'
  gem 'guard-livereload'
  gem "letter_opener"
end

group :development, :test do
  gem 'awesome_print'
  gem 'pry-rails'
  gem 'pry-byebug'

  gem 'rspec-rails', '~> 3.1.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'i18n-tasks'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'database_cleaner', '~> 1.3.0'
  gem 'capybara', '~> 2.4.4'
  gem 'launchy'
  gem 'guard-rspec'

  gem "codeclimate-test-reporter", require: nil
end

group :staging, :production do
  gem 'rails_12factor'

  # Analytics - requires setup
  gem 'newrelic_rpm'
end

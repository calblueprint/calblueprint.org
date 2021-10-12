source 'https://rubygems.org'
ruby '2.6.5'

# Core gems
gem 'rails', '5.2.0'
gem 'puma', '4.3.9'
gem 'pg', '~> 0.18.4'
gem 'figaro', '~> 1.0.0'
gem 'sucker_punch', '~> 1.3.1'
gem 'aasm', '~> 4.1.0'
gem 'dalli' # memcache
gem 'airrecord', '~> 0.2.4'
gem 'google_maps_service'
# Phone number normalization and validation
gem 'phony_rails'

# Components
gem 'turbolinks', '~> 2.5.1'
gem 'devise', '~> 4.7.1'
gem 'devise_invitable', '~> 1.7.4'
gem 'omniauth-facebook', '~> 2.0.1'
gem 'omniauth-google-oauth2', '~> 0.2.6'
gem 'cancancan', '~> 2.2.0'
gem 'simple_form', '~> 5.0.1'
gem 'gon', '~> 5.2.3'
gem 'kaminari', '~> 0.16.1'
gem 'email_validator', '~> 1.4.0'
gem 'recipient_interceptor', '~> 0.1.2'
gem 'enumerize'
gem 'paperclip', '~> 6.0.0'
gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: 'd5ebc0cd846dcc68142622c76ad71d021768b7c2'
gem 'aws-sdk-s3', '~> 1'
gem 'iconv', '~> 1.0.3'
gem 'ffaker'
gem 'draper', '~> 3.0.1'
gem 'gibbon', '~> 3.2.0'
gem 'redcarpet', '~> 3.3.4'
gem 'acts_as_list', '~> 0.7.2'
gem 'state_machine', '~> 1.2.0'
gem 'rack-cors', :require => 'rack/cors'
gem 'validate_url', '~> 1.0.2'
# Frontend
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '~> 5.0.6'
gem 'coffee-rails', '~> 4.2.2'
gem 'jquery-rails', '~> 4.3.3'
gem 'slim-rails', '~> 3.1.3'
gem 'uglifier', '>= 1.3.0'
gem 'autoprefixer-rails', '~> 9.0.0'
gem 'rails_autolink'

gem 'flutie', '~> 2.0.0'
gem 'title', '~> 0.0.5'

gem 'bourbon', '~> 4.2.2'
gem 'neat', '~> 1.7.2'
gem 'bitters', '~> 1.0.0'
gem 'font-awesome-rails', '~> 4.7.0.3'
gem 'ckeditor'

# Error logging - requires setup with service
gem 'rollbar'
# Sentry issue tracking
gem 'sentry-raven'

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-livereload'
  gem 'guard-rubocop'
  gem 'letter_opener'
  gem 'rubocop'
  gem 'rails-erd'

  gem 'scss_lint', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'awesome_print'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  gem 'factory_girl_rails', '~> 4.5.0', require: false
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

  # SSL
  gem 'platform-api'
  gem 'letsencrypt-rails-heroku'
end

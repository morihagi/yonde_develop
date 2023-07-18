source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.6'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use sqlite3 as the database for Active Record
# gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
gem 'sassc-rails'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Bootstrap framework version 5.2.3.
gem 'bootstrap', '5.2.3'

# Fast JavaScript execution within Ruby for Rails applications.
gem 'mini_racer'

# Provides form builders compatible with Bootstrap.
gem 'bootstrap_form'

# Language support for internationalization in Rails.
gem 'rails-i18n'

# Slim templating engine integration for Rails.
gem 'slim-rails'
gem 'erb2slim'
gem 'html2slim'

# Adds helper methods for working with enumerations in Rails.
gem 'enum_help'

# Pagination library for Rails applications.
gem 'kaminari'

# Language support for Kaminari pagination.
gem 'kaminari-i18n'

# Search library for Ruby objects and ActiveRecord.
gem 'ransack'

# Web scraping library for Ruby.
gem 'mechanize'

# User Register and Login
gem 'devise'

group :development, :test do
  # Loads environment variables from a .env file.
  gem 'dotenv-rails'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4'

  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  # Improves error page display.
  gem 'better_errors'

  # Provides a web interface for viewing email messages during development.
  gem 'letter_opener_web'

  # Provides fixtures replacement and object generation for testing.
  gem 'factory_bot_rails'

  # Testing framework for Rails applications.
  gem 'rspec-rails'

  # Generates realistic fake data for testing.
  gem 'faker'

  # Ruby code formatter and style checker.
  gem 'standard', '>= 1.0'

  # Profiles the performance of a Rails application's endpoints.
  gem 'rack-mini-profiler'

  # Retrieves the binding of a method's caller.
  gem 'binding_of_caller'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Validates database constraints at the model level.
  gem 'database_validations'

  # Checks for database consistency.
  gem 'database_consistency', require: false

  # Performs security checks on Rails applications.
  gem 'brakeman', require: false

  # Detects security vulnerabilities in gem dependencies.
  gem 'bundler-audit', require: false

  # Detects N+1 queries and unnecessary queries to improve performance.
  gem 'bullet'

  # Adds database schema comments to models and tests.
  gem 'annotate'

  # Checks code style and quality.
  gem 'rubocop', require: false

  # Checks Rails application code style and quality.
  gem 'rubocop-rails', require: false

  # for fly.io
  gem 'dockerfile-rails', '>= 1.5'
end

group :test do
  # Provides a more readable test progress bar formatter for RSpec.
  gem 'fuubar'

  # Automatically installs and manages web driver binaries for Selenium.
  gem 'webdrivers', require: false

  # Provides RSpec matchers for common Rails functionality.
  gem 'shoulda-matchers'

  # Measures code coverage in Ruby applications.
  gem 'simplecov', require: false

  # integration testing tool
  gem 'capybara'
end

group :production do
  # database
  gem 'pg'
end

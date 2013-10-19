source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use postgres as the database for Active Record (Heroku Requirement)
gem 'pg'

# multi-threaded web server
gem 'puma'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 1.2'

# Use haml as default template engine
gem 'haml'
gem 'haml-rails'

# frontend framework
gem 'compass-rails'
gem 'zurb-foundation', '~> 4.0.0'

# use pry instead of irb
gem 'pry'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

#group :production do
#  # automatically email exceptions
#  gem 'exception_notification'
#end

group :development, :test do
  # Load environment variables
  gem 'dotenv-rails'

  # use rspec as the test suite
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'faker'

  # integration tests
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'

  # fake external requests
  # gem 'fakeweb'

  # use rspec acceptance tests to generate api docs
  #gem "rspec_api_documentation"
end

group :development do
  # use better errors instead of default rails exception pages
  gem 'better_errors'
  gem 'binding_of_caller'

  # init processes via Procfile (used by Heroku)
  gem 'foreman'
  
  # inspect outgoing emails (run `mailcatcher` in the command line)
  gem 'mailcatcher'
end

group :test do
  gem 'database_cleaner'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

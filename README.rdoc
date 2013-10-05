Just a Rails 4 Template
=======================

A starter template for Rails 4 for deploying to Heroku.

## Configuration
* Rspec for test suite
* Puma for web server
* Pry instead of Irb
* Postgres for dev and test environments to mimic heroku.

## Setup
If you use `rvm`, change `.ruby-version` and `.ruby-gemset` to match your rvm settings.

Change the name of the application (which is currently `Template`) in `application.rb`.

Do a find/replace for `Application::Template` and change it to the name of your application.

Rename `database.yml.sample` and `.env.sample` to match your environment settings.

Change `exception notifier` config in `production.rb` to match your email settings.

**IMPORTANT!!!**  When deploying to Heroku, set up env variable `SECRET_TOKEN`.  Use `rake secret` to generate a new one.
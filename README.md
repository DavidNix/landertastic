A Landing Page App
=======================

A little app to display a landing page with the sole purpose of capturing emails.  I built this app to help me test potential business and side project ideas.  The app is built for deployment to Heroku.

## Features
Track hits (web page visits) and leads (when a browser submits their email) in an admin section.

Admin section with easy authentication via environment variables.

Easily download leads into a text file, for later integration into an email marketing service.

Lockable authentication (admin account locks after 10 failed attempts).

Schedule daily emails with statistics of the last 24 hours.  (No need to constantly log into the admin section of the site.)

## Configuration
* The `root_url` is the page to show your visitors.
* Rspec for test suite
* Puma for web server
* Pry instead of Irb
* Postgres for dev and test environments to mimic heroku.

## Setup
**IMPORTANT!!!**
When deploying to Heroku, set up env variable `SECRET_TOKEN`.  Use `rake secret` to generate a new one.  Also set up `USERNAME` and `PASSWORD` environment variables.  See file `.env.sample` for a list of required environment variables.

Rename `database.yml.sample` and `.env.sample` to match your environment settings.

Set up ActionMailer settings as usual for production environment if you want emails sent to you.

Use heroku scheduler to schedule `rake stats:daily` if you want a notification of the latest stats for the last 24 hours.

Log into `/admin` and change the site name and email that you want daily stats sent to.

# FAQ

### What if my account is locked out?
Log into the console and change the `failed_attempts` column of the `admin_settings` table to 0.  There will be only one `admin_settings` record.
source 'https://rubygems.org'

gem 'rails', '4.2.5'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.3.5'

gem 'friendly_id', '~> 5.1.0'
gem 'text-hyphen'
gem 'execjs'
gem 'therubyracer'
gem 'figaro'

gem "rorvswild"

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'guard-rspec', require: false
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :test do
  gem 'capybara', '~> 2.4.0'
  gem 'launchy', '~> 2.4'
  gem 'database_cleaner', '~> 1.3'
  gem 'shoulda-matchers', require: false
  gem 'capybara-webkit'
  gem 'codeclimate-test-reporter', require: nil
end

gem 'unicorn', '~> 4.8.3'

group :development do
  gem 'capistrano', '~> 3.2.1'
  # rails specific capistrano functions
  gem 'capistrano-rails', '~> 1.1.0'
  # integrate bundler with capistrano
  gem 'capistrano-bundler'
  # if you are using Rbenv
  gem 'capistrano-rbenv', "~> 2.0"
  # include helper tasks
  gem 'capistrano-cookbook', require: false
end

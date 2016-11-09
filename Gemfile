source 'https://rubygems.org'

ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'mechanize'
gem 'awesome_print'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap', '~> 4.0.0.alpha3.1'
gem 'rails-assets-tether', '~> 1.1', '>= 1.1.1'
gem 'jquery-ui-rails', '~> 5.0', '>= 5.0.5'
gem 'font-awesome-rails'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'dotenv-rails'
gem 'two_captcha'
gem 'watir'
gem 'watir-extensions-element-screenshot'
gem 'omniauth-facebook', '~> 4.0'
gem 'httparty'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'ffaker'
end

group :test do
  gem 'shoulda-matchers'
end
gem 'capybara', :group => :test
group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'compass'
  gem 'rb-fsevent', :require => false # Mac OSX
  gem 'guard-compass'
  gem 'guard-livereload', '~> 2.5', require: false
end

group :production, :staging do
  gem 'rails_12factor', '~> 0.0.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
#gem 'devise-async'
gem 'crono'
gem 'has_secure_token'

source 'https://rubygems.org'
ruby "2.6.3"
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails_12factor', group: :production

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bootsnap'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'geocoder'
gem "aws-sdk-s3", require: false
gem 'aws-sdk'
gem 'geokit'
gem 'gmaps4rails'
gem 'rqrcode-with-patches', '~> 0.5.4'
gem 'barby',  '~> 0.6.2'
gem 'rqrcode','~> 0.4.2'
gem 'rqrcode_png'
gem 'underscore-rails', '~> 1.8', '>= 1.8.3'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
gem 'font-awesome-sass', '~> 5.13.0'
gem 'bootstrap-sass', '~> 3.3.6'
gem "paperclip", "~> 5.0.0"
gem 'jquery-rails'
gem 'bootstrap_form'
gem 'devise'
gem 'devise-security'
gem 'pusher'
gem 'rails-jquery-autocomplete'
gem 'jquery-ui-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'twilio-ruby','~> 5.23.1'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'listen'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.6'
  gem 'factory_bot'
  gem 'rails-controller-testing'
  gem 'headless'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem "figaro"
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end
gem'actiontext',github:'kobaltz/actiontext',branch:'archive',require:'action_text'
gem 'image_processing'
gem 'webpacker', '~> 4.x'

gem 'rack-cors'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'acts-as-taggable-on', '~> 6.0'
gem 'simple_form'
group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'mini_magick'
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'active_storage_validations'
gem "aws-sdk-s3", require: false
gem 'bcrypt',     '~> 3.1.16'
gem 'bootsnap',   '~> 1.7', require: false
gem 'bootstrap',  '~> 4.5.0'
gem 'chart-js-rails'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'dotenv-rails'
gem 'faker'
gem 'image_processing', '1.2'
gem 'impressionist'
gem 'jbuilder',   '~> 2.11'
gem 'kaminari'
gem 'kaminari-bootstrap'
gem 'material_icons'
gem 'mini_magick'
gem 'mini_racer', '~> 0.3.1'
gem 'mysql2', '~> 0.5.3'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-twitter'
gem 'puma',       '~> 5'
gem 'rails',      '~> 6.1'
gem 'rails-i18n', '~> 6.0'
gem 'sass-rails', '~> 6'
gem 'simple_calendar', '~> 2.0'
gem 'turbolinks', '~> 5.2.0'
gem 'webpacker',  '5.4.0'

group :development, :test do
  gem 'capistrano'
  gem 'capistrano3-puma'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 5.0'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '~> 3.5.1' 
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec'
  gem 'spring', '~> 2.1.0'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.1'
  gem 'web-console',           '~> 4.1.0'
end

group :test do
  gem 'capybara'           
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'webdrivers'         
end

# Windows ではタイムゾーン情報用の tzinfo-data gem を含める必要があります
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
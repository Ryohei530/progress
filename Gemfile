source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'rails',      '~> 6.1'
gem 'bcrypt',     '~> 3.1.16'
gem 'bootstrap',  '~> 4.5.0'
gem 'puma',       '~> 5.3'
gem 'sass-rails', '~> 6'
gem 'webpacker',  '5.4.0'
gem 'turbolinks', '~> 5.2.0'
gem 'jbuilder',   '~> 2.11'
gem 'bootsnap',   '~> 1.7', require: false
gem 'mysql2',     '~> 0.5.3'
gem 'kaminari'
gem 'kaminari-bootstrap'
gem 'active_storage_validations'
gem 'image_processing'
gem 'mini_magick'
gem 'simple_calendar', '~> 2.0'
gem 'rails-i18n', '~> 6.0'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'

group :development, :test do
  gem 'byebug',  '~>11.1.3', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.0'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'web-console',           '~> 4.1.0'
  gem 'listen',                '~> 3.5.1'
  gem 'spring',                '~> 2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.1'
  gem 'spring-commands-rspec'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'capybara'           
  gem 'webdrivers'         
  gem 'launchy'
  gem 'shoulda-matchers'
end

# Windows ではタイムゾーン情報用の tzinfo-data gem を含める必要があります
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails',      '6.0.3'
gem 'bcrypt'
gem 'bootstrap', '~> 4.5.0'
gem 'puma',       '4.3.6'
gem 'sass-rails', '5.1.0'
gem 'webpacker',  '4.0.7'
gem 'turbolinks', '5.2.0'
gem 'jbuilder',   '2.9.1'
gem 'bootsnap',   '1.4.5', require: false
gem 'mysql2'
gem 'kaminari'
gem 'kaminari-bootstrap'
gem 'active_storage_validations'
gem 'image_processing'
gem 'mini_magick'

group :development, :test do
  gem 'byebug',  '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.0.0.beta2'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'web-console',           '4.0.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
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
source 'https://rubygems.org'

gem 'rails', '3.2.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem "twitter-bootstrap-rails", "~> 2.0rc0"
gem 'rails_autolink'
gem 'kaminari'
group :test, :development do
  gem 'mysql2'
  gem 'heroku'
  gem 'rspec-rails'
  gem 'spork', '~> 0.9.0.rc'
  gem 'guard'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'rb-fsevent', :require => false
  gem 'taps'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :production do
  gem 'pg'
  gem 'thin'
end

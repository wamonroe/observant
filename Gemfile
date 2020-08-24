source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Drivers
gem 'pg', '>= 0.18', '< 2.0'
gem 'redis', '~> 4.0'

gem 'puma', '~> 4.1'

# JavaScript and assets
gem 'stimulus_reflex', '~> 3.2'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

# Jobs
gem 'clockwork', '~> 2.0', '>= 2.0.4'
gem 'daemons', '~> 1.3', '>= 1.3.1'
gem 'good_job', '~> 1.0', '>= 1.0.3'

# Other
gem 'bootsnap', '>= 1.4.2', require: false

# Web Scraping
gem 'httparty', '~> 0.18.1'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'

  # Code formatting and style checking
  gem 'rubocop', '~> 0.88.0'
  gem 'rubocop-performance', '~> 1.7', '>= 1.7.1'
  gem 'rubocop-rails', '~> 2.7'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bootsnap', '>= 1.1.0', require: false               # Reduces boot times through caching; required in config/boot.rb
gem 'bootstrap-sass'                                     # Using Bootsrap Sass
gem 'cocoon'                                             # Add/Remove UI functionality for nested attributes
gem 'coffee-rails', '~> 4.2'                             # Use CoffeeScript for .coffee assets and views
gem 'devise'                                             # User authentication
gem 'jbuilder', '~> 2.5'                                 # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jquery-rails'
gem 'jquery-ui-rails'                                    # jquery ui library
gem 'pg', '>= 0.18', '< 2.0'                             # Use postgresql as the database for Active Record
gem 'puma', '~> 3.11'                                    # Use Puma as the app server
gem 'rails', '~> 5.2.1'                                  # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rubocop', '~> 0.65.0', require: false               # Ruby code analyser
gem 'sass-rails', '~> 5.0'                               # Use SCSS for stylesheets
gem 'select2-rails'                                      # Multiple Selections from dropdown
gem 'sendgrid-ruby'                                      # Send live mails
gem 'toastr_rails'                                       # Designed Flash messages
gem 'turbolinks', '~> 5'                                 # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'uglifier', '>= 1.3.0'                               # Use Uglifier as compressor for JavaScript assets

group :development, :test do
  gem 'awesome_rails_console'                            # Simpler prompt modification (Closer to the default pry prompt you're familiar with)
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]    # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'hirb'                                             # dependancy gems to the awesome_rails_console(rails g awesome_rails_console:install)
  gem 'hirb-unicode-steakknife', require: 'hirb-unicode' # dependancy gems to the awesome_rails_console(rails g awesome_rails_console:install)
  gem 'pry-byebug'                                       # dependancy gems to the awesome_rails_console(rails g awesome_rails_console:install)
  gem 'pry-stack_explorer'                               # dependancy gems to the awesome_rails_console(rails g awesome_rails_console:install)
end

group :development do
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails'
  gem 'spring'                                           # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'                          # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
end

group :test do
  gem 'capybara', '>= 2.15'                              # Adds support for Capybara system testing and selenium driver
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'                               # Easy installation and use of chromedriver to run system tests with Chrome
end

gem 'annotate', git: 'https://github.com/ctran/annotate_models.git', require: false         # Used to annotate models (view table attributes)
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]                          # Windows does not include zoneinfo files, so bundle the tzinfo-data gem

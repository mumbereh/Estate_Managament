source "https://rubygems.org"

 ruby "3.2.2"


gem "rails", "~> 7.1.3", ">= 7.1.3.3"  # Using the latest stable Rails version

gem 'execjs', '~> 2.9.1'

gem "sprockets-rails"  # Asset pipeline for Rails

gem "mail"  # Handle email sending

gem "pg"  # PostgreSQL database for Active Record

gem "kaminari"  # Pagination support

gem "will_paginate", "~> 3.3"  # Alternative pagination gem

gem "groupdate", "~> 3.0"  # For time grouping in reports

gem "puma", ">= 5.0"  # Puma web server

gem "importmap-rails"  # Use JavaScript with ESM import maps

gem "turbo-rails"  # SPA-like experience via Hotwire's Turbo

gem "stimulus-rails"  # For modest JavaScript framework Stimulus

gem "jbuilder"  # For building JSON APIs

gem 'autoprefixer-rails', '~> 10.4.19.0'

gem "httparty"  # For making HTTP requests

gem "dotenv-rails", groups: [:development, :test]  # Environment variable management

gem "tzinfo-data", platforms: %i[windows jruby]  # Timezone info on Windows

gem "bootsnap", require: false  # Speeds up boot times

gem "bootstrap", "~> 5.3", ">= 5.3.3"  # Latest Bootstrap for styling

gem "devise"  # Authentication support

gem "wicked_pdf"  # PDF generation

gem "wkhtmltopdf-binary"  # Binary dependency for PDF generation

gem "sassc-rails", "~> 2.1"  # SassC for faster Sass compilation

group :development, :test do
  gem "debug", platforms: %i[mri windows]  # Debugging support
end

group :development do
  gem "web-console"  # Rails console for the browser
end

group :test do
  gem "capybara"  # System testing
  gem "selenium-webdriver"  # Web driver for testing
end

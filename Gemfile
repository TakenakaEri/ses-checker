source "https://rubygems.org"

ruby "3.2.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3", ">= 7.1.3.4"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# HTMLを操作する https://nokogiri.org/index.html
gem 'nokogiri'

# HTTPのリクセストをする(APIを叩くため) https://github.com/jnunemaker/httparty
gem 'httparty'

# .envを使用するため https://github.com/bkeepers/dotenv
gem 'dotenv-rails', groups: [:development, :test]

# 失敗したコード ブロックを再試行する  https://github.com/kamui/retriable
gem 'retriable'

# google認証をするためのgem
# https://github.com/heartcombo/devise
gem 'devise'
# https://github.com/omniauth/omniauth
gem 'omniauth'
# https://github.com/zquestz/omniauth-google-oauth2
gem 'omniauth-google-oauth2'
# https://github.com/cookpad/omniauth-rails_csrf_protection
gem 'omniauth-rails_csrf_protection'

#アイコン https://github.com/Angelmmiguel/material_icons
gem 'material_icons'

# 日本語化
gem 'rails-i18n'
gem 'devise-i18n'

# フラッシュメッセージを時間指定で消す
gem "jquery-rails"

# ページネーション https://github.com/kaminari/kaminari
gem 'kaminari'

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# https://github.com/wentaoliu/particles-js-rails
gem 'particles-js-rails'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

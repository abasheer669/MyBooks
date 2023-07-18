source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "rails", "~> 7.0.6"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "active_model_serializers"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
end

group :test do
  gem 'faker'
end

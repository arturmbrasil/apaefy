source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.2"
gem "pg", "~> 0.18"
gem "puma", "~> 3.7"

# Authentication
gem "devise"

# Front end
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "jbuilder", "~> 2.5"
gem "bootstrap", "~> 4.0.0.beta2.1"
gem "jquery-rails"
gem "feathericon-sass"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "rspec-rails", "~> 3.6"
  gem "rubocop", require: false
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "bullet"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "shoulda-matchers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

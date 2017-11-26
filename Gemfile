source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.2"
gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "rails-i18n", "~> 5.0.0"
gem "cpf_cnpj"
gem "kaminari"
gem "filterrific"
gem "chartkick"
gem "groupdate"

# Authentication
gem "devise"
gem "devise-i18n"

# Front end
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "jbuilder", "~> 2.5"
gem "bootstrap", "4.0.0.alpha6"
gem "tether-rails"
gem "jquery-rails"
gem "font-awesome-sass", "~> 4.7.0"
gem 'rails-assets-jquery-mask', source: 'https://rails-assets.org'

gem 'faker'
gem 'wdm', '>= 0.1.0' if Gem.win_platform?

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

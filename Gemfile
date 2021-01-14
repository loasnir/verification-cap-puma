# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'puma'
gem 'rack'

gem 'sinatra'
gem 'slim', '4.0.0'

group :development, :test do
  gem 'capistrano', '3.14.1', require: false
  gem 'capistrano3-puma', '~> 4.0.0', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-passenger', require: false
  gem 'capistrano-rbenv', require: false
  gem 'rubocop'
end

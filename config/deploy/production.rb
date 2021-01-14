# frozen_string_literal: true

set :bundle_without, 'deployment'
set :deploy_to, '/var/www/html'
set :bundle_flags, '--quiet'

set :branch, 'main'
server 'verification-cap-puma', user: 'vagrant', roles: [:web]

# frozen_string_literal: true

# require 'net/ssh/proxy/command'

set :bundle_without, 'deployment'
set :bundle_flags, '--quiet'

set :deploy_to, '/var/www/html'
set :branch, 'main'
server 'verification-cap-puma', user: 'vagrant', roles: [:web]

# frozen_string_literal: true
require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/puma'
# NOTE: rake_roles is loaded in the phase of `require 'capistrano/rake'`, so there is a need to be defined before require.
#   see https://github.com/sheharyarn/capistrano-rake/blob/v0.2.0/lib/capistrano/tasks/invoke.rake#L4
set :rake_roles, :db
require 'capistrano/rake'
require 'capistrano/rails/console'
install_plugin Capistrano::Puma

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

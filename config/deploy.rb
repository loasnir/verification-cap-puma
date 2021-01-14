# frozen_string_literal: true
lock '3.14.1'

set :application, 'verification-cap-puma'
set :repo_url, 'git@github.com:loasnir/verification-cap-puma.git'

if ENV['CIRCLE_BRANCH']
  set :branch, ENV['CIRCLE_BRANCH']
else
  ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
end

set :linked_sync_configs, [
  '.env'
]
set :linked_files, fetch(:linked_files, []).push(
  'maintenance/503.html'
) + fetch(:linked_sync_configs)

set :linked_dirs, fetch(:linked_dirs, []).push(
  'tmp/cache',
  'tmp/pids',
  'public/uploads',
  'log'
)
set :git_shallow_clone, 1

namespace :deploy do
  desc 'Clear caches before preparing to deploy'
  task :clear_caches do
    on roles(:web, :job) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rails, 'tmp:cache:clear'
        end
      end
    end
  end

  before :starting, 's3:sync_config'
  before :updated, 'i18n:export'
  before :updated, 'pipenv:sync'
  before :reverted, 'pipenv:sync'
  before :finishing, 'deploy:clear_caches'

  after :publishing, 'systemd:sidekiq:restart'
end

set :puma_preload_app, false
set :puma_workers, 2

# Skip migration if files in db/migrate were not modified
set :conditionally_migrate, true

# Clean up old assets after each deploy
set :keep_assets, fetch(:keep_releases)

set :assets_roles, [:web, :job]

set :console_role, :db

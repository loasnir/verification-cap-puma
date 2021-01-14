# frozen_string_literal: true

lock '3.14.1'

set :application, 'verification-cap-puma'

set :repo_url, 'git@github.com:loasnir/verification-cap-puma.git'
set :branch, 'main'
set :git_shallow_clone, 1

set :linked_files, fetch(:linked_files, []).push

set :linked_dirs, fetch(:linked_dirs, [
  'tmp/pids',
  'tmp/sockets',
  'log'
]).push

set :puma_preload_app, false
set :puma_workers, 2

set :rbenv_ruby_version, '2.7.2'
set :rbenv_path, "/home/vagrant/.rbenv" #指定するとこのパスは以下のbundleが、指定しないと$HOME配下のbundleが実行された
set :bundle_path, './vendor/bundle'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} #{fetch(:rbenv_path)}/bin/rbenv exec"

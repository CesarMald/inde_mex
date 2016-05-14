# config valid only for current version of Capistrano
lock '3.5.0'

require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/ssh"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"

ssh_options[:forward_agent] = true


set :application, 'idenmex'
set :deploy_via, :remote_cache
set :repo_url,  "git@github.com:antidoto-mx/#{application}.git"
set :scm, "git"
set :repository, "git@github.com:antidoto-mx/#{application}.git"
set :branch, "master"
set :shared_children, shared_children + %w{public/uploads}

default_run_options[:pty] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases
before "deploy:restart", "bundle:install"


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5


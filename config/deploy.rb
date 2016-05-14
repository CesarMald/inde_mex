set :stages, %w(production staging)
set :default_stage, "staging"

require 'capistrano/ext/multistage'
require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/ssh"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"
load "config/recipes/imagemagick"
load "config/recipes/redis"

ssh_options[:forward_agent] = true

set :application, "idenmex"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:antidoto-mx/#{application}.git"
set :branch, "master"
set :shared_children, shared_children + %w{public/uploads}

default_run_options[:pty] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases
before "deploy:restart", "bundle:install"



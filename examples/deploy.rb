require "bundler/capistrano"
load "deploy/assets"
require "rvm/capistrano"

# Multistage
set :stages, %w(staging production)
require 'capistrano/ext/multistage'

# RVM settings
set :rvm_ruby_string, "2.0.0-p247"        # use the same ruby as used locally for deployment
set :rvm_type, :system
before 'deploy', 'rvm:create_gemset' # install Ruby and create gemset (both if missing)

# App settings
set :application, "segway"
set :repository,  "git@github.com:blueberryapps/segwaypoint-backend.git"
set :branch,      "master"

# Server settings
set :use_sudo,        false
set :keep_releases,   2
set :group_writable,  false
ssh_options[:forward_agent] = true

namespace :deploy do
  # Passenger settings
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  # Symlink shared config
  before "deploy:finalize_update", "deploy:symlink_shared"
  task :symlink_shared do
    run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
  end

  # RAILS 4 needs this by now
  namespace :assets do
    task :precompile, :roles => assets_role, :except => { :no_release => true } do
      run <<-CMD.compact
        cd -- #{latest_release.shellescape} &&
        #{rake} RAILS_ENV=#{rails_env.to_s.shellescape} #{asset_env} assets:precompile
      CMD
    end
  end
end
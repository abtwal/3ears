# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "3ears"
set :repo_url, "git@github.com:abtwal/3ears.git"
set :user, 'threeears'
set :nvm_type, :user
set :nvm_node, 'v12.4.0'
set :nvm_map_bins, %w{node npm yarn}
set :deploy_to,"/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :yarn_flags, %w(--silent --no-progress)

set :ssh_options, { forward_agent: true, auth_methods: %w(publickey) }
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
# append :linked_files, '.env'
append :linked_dirs, 'node_modules'
# Default deploy_to directory is /var/www/my_app_name

namespace :deploy do
  task :yarn_deploy do
    on roles fetch(:yarn_roles) do
      within fetch(:yarn_target_path, release_path) do
        execute fetch(:yarn_bin), 'build'
      end
    end
  end

  before "symlink:release", :yarn_deploy
end

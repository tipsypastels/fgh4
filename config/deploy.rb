set :application, "fgh4"
set :repo_url, "https://github.com/tipsypastels/fgh4"

# Deploy to the user's home directory
set :deploy_to, "/home/deploy/#{fetch :application}"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

# Only keep the last 5 releases to save disk space
set :keep_releases, 3

set :log_level, :debug

# Optionally, you can symlink your database.yml and/or secrets.yml file from the shared directory during deploy
# This is useful if you don't want to use ENV variables
# append :linked_files, 'config/database.yml', 'config/secrets.yml'
set :default_run_options, { pty: true }

before "deploy:assets:precompile", "deploy:yarn_install"

desc 'Run rake yarn:install'
namespace :deploy do
  task :yarn_install do
    on roles(:web) do
      within release_path do
        execute("cd #{release_path} && yarn install")
      end
    end
  end
end

Rake::Task['deploy:assets:precompile'].clear

namespace :deploy do
  namespace :assets do
    desc 'Precompile assets locally and then rsync to remote servers'
    task :precompile do
      %x{bundle exec rake assets:precompile assets:clean}

      local_manifest_path = %x{ls -a public/assets/.*manifest*}.strip
      on roles(fetch(:assets_roles)) do |server|
        %x{rsync -avr --exclude='.DS_Store' ./public/assets/ #{server.user}@#{server.hostname}:#{release_path}/public/assets/}
        %x{rsync -avr --exclude='.DS_Store' ./#{local_manifest_path} #{server.user}@#{server.hostname}:#{release_path}/assets_manifest#{File.extname(local_manifest_path)}}
      end

      %x{bundle exec rake assets:clobber}
    end
  end
end
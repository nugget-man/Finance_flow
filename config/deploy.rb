set :application, "Financeflow"
default_run_options[:pty] = true
set :repository,  "git@github.com:nugget-man/Finance_flow.git"
set :user, "evmeisterx"
set :scm_passphrase, "Maxis22222"
set :scm, "git"
set :branch, "master"



set :deploy_via, :remote_cache
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "Thin"                          # Your HTTP server, #Apache/etc
role :app, "Thin"                          # This may be the #same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where #Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

require 'capistrano_colors' if $stdout.tty? and $stderr.tty?
require "bundler/capistrano"
require 'capistrano/ext/multistage'

set :application, "test-app"
set :repository, "none"
set :deploy_to,   "/home/app/deploy"

# rbenv setting
#require 'capistrano-rbenv'
#require 'capistrano-rbenv-ruby193deps-centos5'
#set :rbenv_ruby_version, '1.9.3-p374'


task :install_omnibus_chef do
  run "curl -L http://www.opscode.com/chef/install.sh | #{top.sudo} bash"
end
after 'deploy:setup', 'install_omnibus_chef'


require 'capistrano-paratrooper-chef'
#require 'capistrano-paratrooper-chef/install'
set :chef_solo_path, '/opt/chef/bin/chef-solo'
#set :chef_roles_auto_discovery, true

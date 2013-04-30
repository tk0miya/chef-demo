require 'capistrano_colors' if $stdout.tty? and $stderr.tty?
require "bundler/capistrano"
require 'capistrano/ext/multistage'

set :application, "test-app"
set :repository, "none"
set(:deploy_to) { File.join(fetch(:home_directory), 'deploy') }
set(:home_directory) { capture("echo $HOME").strip }

# rbenv setting
#require 'capistrano-rbenv'
#require 'capistrano-rbenv-ruby193deps-centos5'
#set :rbenv_ruby_version, '1.9.3-p374'


require 'capistrano-paratrooper-chef'
#require 'capistrano-paratrooper-chef/install'
require 'capistrano-paratrooper-chef/omnibus_install'
set :chef_roles_auto_discovery, true

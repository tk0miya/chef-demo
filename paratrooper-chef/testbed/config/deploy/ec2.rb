# SSH settings
ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/default.pem"]
default_run_options[:pty] = true
set :user     , "ec2-user"
set :use_sudo , false

# role settings
server "ec2-54-249-144-70.ap-northeast-1.compute.amazonaws.com", :web, :app, :db, :jenkins, :primary => true

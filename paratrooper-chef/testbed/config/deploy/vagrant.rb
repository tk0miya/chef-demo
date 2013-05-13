# SSH settings
ssh_options[:port] = "2222"
ssh_options[:forward_agent] = true
default_run_options[:pty] = true
set :user     , "vagrant"
set :password , "vagrant"
set :use_sudo , false

# role settings
role :web , "localhost"
role :app , "localhost"
role :db  , "localhost" , :primary => true

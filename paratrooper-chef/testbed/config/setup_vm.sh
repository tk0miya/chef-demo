#!/bin/sh

# create account: app
sudo /usr/sbin/groupadd -g 10000 app
sudo /usr/sbin/adduser  -u 10000 app -g app -G app,wheel
echo 'app' | sudo passwd --stdin app
if [ -d /etc/sudoers.d ]; then
  echo "app        ALL=(ALL)       NOPASSWD: ALL" | sudo tee /etc/sudoers.d/app
  sudo chmod 0440 /etc/sudoers.d/app
else
  sudo sh -c 'grep -q "app " /etc/sudoers || echo "app        ALL=(ALL)       NOPASSWD: ALL" | tee -a /etc/sudoers'
fi

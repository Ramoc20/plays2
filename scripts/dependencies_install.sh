#!/bin/bash
export PATH=/home/ubuntu/.rvm/gems/ruby-3.0.5/bin:/home/ubuntu/.rvm/gems/ruby-3.0.5@global/bin:/home/ubuntu/.rvm/rubies/ruby-3.0.5/bin:/home/ubuntu/bin:/home/ubuntu/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/ubuntu/.rvm/bin:/home/ubuntu/.rvm/bin
sudo kill -9 $(cat /var/www/sportsm/tmp/pids/server.pid)
cd /var/www/sportsm/
#sudo apt-get install ruby2.3-dev libffi-dev -y
gem install nokogiri — — use-system-libraries
bundle config build.nokogiri — use-system-libraries
gem install bundler — user-install
bundle install
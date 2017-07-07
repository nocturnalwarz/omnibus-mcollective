#!/bin/bash

yum install -y git gcc gcc-c++ openssl-devel readline-devel zlib-devel rpm-build epel-release
yum install -y gecode gecode-devel

mkdir /root/downloads
cd /root/downloads

wget https://github.com/rbenv/rbenv/archive/v1.1.1.tar.gz

cd /root

tar -xvzf /root/downloads/v1.1.1.tar.gz

# Setup rbenv path
echo 'export PATH="$HOME/rbenv-1.1.1/bin:$PATH"' >> ~/.bash_profile
export PATH="$HOME/rbenv-1.1.1/bin:$PATH"

hash -r

echo 'eval "$(rbenv init -)"' >> ~/.bash_profile


~/rbenv-1.1.1/bin/rbenv init
mkdir -p ~/.rbenv/plugins

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install $(cat /vagrant/.ruby-version)

cd /vagrant

echo $(pwd)

eval "$(rbenv init -)"

export USE_SYSTEM_GECODE=1 

gem install bundler

bundle install --binstubs
bundle exec omnibus build mcollective --no-timestamp





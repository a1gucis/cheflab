#!/usr/bin/env bash

source /vagrant/common.sh

CHEF_DEV_KIT_SOURCE="https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.4.0-1_amd64.deb"
CHEF_DEV_KIT_DEB="${HOME}/chefdk.deb"

# Install the chef-dev-kit
wget ${CHEF_DEV_KIT_SOURCE} -O ${CHEF_DEV_KIT_DEB}
sudo dpkg -i ${CHEF_DEV_KIT_DEB}
chef verify

cd ${CHEF_REPO}
knife ssl fetch
knife client list

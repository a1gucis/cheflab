#!/usr/bin/env bash

source /vagrant/common.sh

CHEF_SERVER_SOURCE="https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.0.7-1_amd64.deb"
CHEF_SERVER_DEB="${HOME}/chef-server-core.deb"

# Install the chef-server
wget ${CHEF_SERVER_SOURCE} -O ${CHEF_SERVER_DEB}
sudo dpkg -i ${CHEF_SERVER_DEB}
sudo chef-server-ctl reconfigure

# Create an Admin User and Organization
sudo chef-server-ctl user-create ${CHEF_USER} ${CHEF_USER} ${CHEF_USER} ${CHEF_USER}@example.com ${CHEF_PASS} -f ${CHEF_USER_PEM}
sudo chef-server-ctl org-create ${CHEF_ORGANIZATION} "LocalLab, Inc." --association_user ${CHEF_USER} -f ${CHEF_ORGANIZATION_PEM}
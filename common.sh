#!/usr/bin/env bash


export VAGRANT_HOME="/home/vagrant"
export VAGRANT_ROOT="/vagrant"
export CHEF_MASTER="chefmaster"
export CHEF_REPO="${VAGRANT_ROOT}/chef-repo"
export CHEF_USER="admin"
export CHEF_PASS="adminpass"
export CHEF_ORGANIZATION="locallab"
export CHEF_USER_PEM="${CHEF_REPO}/.chef/${CHEF_USER}.pem"
export CHEF_ORGANIZATION_PEM="${CHEF_REPO}/.chef/${CHEF_ORGANIZATION}-validator.pem"

cat  >>${VAGRANT_HOME}/.bashrc <<EOL
export VAGRANT_ROOT=${VAGRANT_ROOT}
export CHEF_MASTER=${CHEF_MASTER}
export CHEF_REPO=${CHEF_REPO}
export CHEF_USER=${CHEF_USER}
export CHEF_PASS=${CHEF_PASS}
export CHEF_ORGANIZATION=${CHEF_ORGANIZATION}
export CHEF_USER_PEM="${CHEF_USER_PEM}"
export CHEF_ORGANIZATION_PEM="${CHEF_ORGANIZATION_PEM}"
EOL
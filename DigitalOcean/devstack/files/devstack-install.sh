#!/bin/bash
#
# DevStack script to build from source on Ubuntu 16.04 based on 
# instructions provided at http://devstack.org
#
# Authors:  Eric Wright (@DiscoPosse)
#           

# Update the Ubuntu system
apt update -y

# Install Git anmd Vim because I'm a nerd and need them
apt install -y git vim 

# Add the Stack user
adduser Stack

# Add Stack to the sudoers file
echo "stack ALL=(ALL) NOPASSWD: ALL" | tee --append /etc/sudoers > /dev/null

# change to the Stack user
su stack 

# Clone the repo into the home folder of the Stack users
git clone https://git.openstack.org/openstack-dev/devstack /home/stack/devstack 

# Create the local configuration file for passwords of the admin users, rabbit, and database
# NOTE:  You should change these if you wish
echo '
[[local|localrc]]
ADMIN_PASSWORD=secret-do
DATABASE_PASSWORD=openstack-do
RABBIT_PASSWORD=openstack-do
SERVICE_PASSWORD=openstack-do' | tee /home/stack/devstack/local.conf 

# Start the installation
./home/stack/devstack/stack.sh 

# Completion
echo "All Done - Welcome to your new DevStack instance"

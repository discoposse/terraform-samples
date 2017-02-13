#!/bin/bash
#
# DevStack script to build from source on Ubuntu 16.04 based on 
# instructions provided at http://devstack.org
#
# Authors:  Eric Wright (@DiscoPosse)
#           

# Set environment up
export DEBIAN_FRONTEND=noninteractive
export devstackhorizon=FALSE

# Update the Ubuntu system
apt update -y

# Install Git anmd Vim because I'm a nerd and need them
apt install -y git vim 

# Add the Stack user
#adduser Stack

# Add Stack to the sudoers file
#echo "stack ALL=(ALL) NOPASSWD: ALL" | tee --append /etc/sudoers > /dev/null

# change to the Stack user
#su stack 

# Clone the repo into the home folder of the Stack users
git clone https://git.openstack.org/openstack-dev/devstack /tmp/devstack 

# Create the stack user
bash /tmp/devstack/tools/create-stack-user.sh

# Add Stack to the sudoers file
echo "stack ALL=(ALL) NOPASSWD: ALL" | tee --append /etc/sudoers > /dev/null

# Set the ownership so that Stack can write to the tmp folder
chown -R stack: /tmp/devstack

# Create the local configuration file for passwords of the admin users, rabbit, and database
# NOTE:  You should change these if you wish
echo '[[local|localrc]]
ADMIN_PASSWORD=secret-do
DATABASE_PASSWORD=openstack-do
RABBIT_PASSWORD=openstack-do
SERVICE_PASSWORD=openstack-do' | tee /tmp/devstack/local.conf 

# Start the installation
sudo -u stack -H sh -c "bash /tmp/devstack/stack.sh" 

# Completion check
#until $devstackhorizon=TRUE
#do
#if grep "Horizon is now available" /var/log/cloud-init-output.log; then
#        grep "Horizon is now available" /var/log/cloud-init-output.log > /tmp/horizon.txt
#        export devstackhorizon=TRUE
#else
        #do mothing
#fi
#done

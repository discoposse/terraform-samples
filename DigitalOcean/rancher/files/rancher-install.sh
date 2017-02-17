#!/bin/bash
#
# Installation script for Docker and Rancher on CentOS 7
#
# Authors:  Eric Wright (@DiscoPosse)
#           
#
#

tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

yum update -y
yum install -y docker-engine
systemctl enable docker.service
systemctl start docker
docker run -d --name myrancher --restart=always -p 8080:8080 rancher/server


#!/bin/bash

sudo yum update -y 
sudo yum-config-manager --enable epel
sudo yum update -y 
sudo yum groupinstall -y "Development tools"
sudo yum install -y kernel-devel-`uname -r`
sudo yum install -y p7zip
sudo cp /usr/bin/7za /usr/bin/7z

#wget http://us.download.nvidia.com/XFree86/Linux-x86_64/340.102/NVIDIA-Linux-x86_64-340.102.run
wget http://us.download.nvidia.com/XFree86/Linux-x86_64/367.57/NVIDIA-Linux-x86_64-367.57.run

sudo sh NVIDIA-Linux-x86_64-367.57.run -q -a -n -s -X

echo <<EOF | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
blacklist lbm-nouveau
options nouveau modeset=0
alias nouveau off
alias lbm-nouveau off
EOF

wget https://hashcat.net/files/hashcat-3.5.0.7z
7z x hashcat-3.5.0.7z

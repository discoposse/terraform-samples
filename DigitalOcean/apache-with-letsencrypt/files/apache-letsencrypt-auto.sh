#!/bin/bash
#
# simple script to build apache http server and  
#
# Authors:  Eric Wright (@DiscoPosse)
#           

# Update all the things
yum update -y
yum install -y epel-release
yum update -y

# Install Apache 
yum install -y httpd vim

# Set to start httpd service automatically 
sudo systemctl enable httpd.service

# Create our base directory
mkdir -p /var/www/yourdomain.com/public_html
chmod -R 755 /var/www

echo '<html>
  <head>
    <title>Welcome to yourdomain.com!</title>
  </head>
  <body>
    <h1>Success! The yourdomain.com virtual host is working!</h1>
  </body>
</html>
' | tee /var/www/yourdomain.com/public_html/index.html 

# Create our virtual servers
mkdir -p /etc/httpd/sites-available
mkdir -p /etc/httpd/sites-enabled

echo 'IncludeOptional sites-enabled/*.conf' >> /etc/httpd/conf/httpd.conf

echo '<VirtualHost *:80>

    ServerName www.yourdomain.com
    ServerAlias yourdomain.com
    DocumentRoot /var/www/yourdomain.com/public_html
    ErrorLog /var/www/yourdomain.com/error.log
    CustomLog /var/www/yourdomain.com/requests.log combined
</VirtualHost>
' | tee /etc/httpd/sites-available/yourdomain.com.conf

ln -s /etc/httpd/sites-available/yourdomain.com.conf /etc/httpd/sites-enabled/yourdomain.com.conf

apachectl restart

firewall-cmd --add-service=http --permanent && firewall-cmd --add-service=https --permanent
systemctl restart firewalld

# Install the cerbot for apache
yum install -y python-certbot-apache bind-utils



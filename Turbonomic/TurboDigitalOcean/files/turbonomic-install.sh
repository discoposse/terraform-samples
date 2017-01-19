#!/bin/bash
#
# Turbonomic script to build from source on CentOS
#
# Authors:  Stephen Wilson 
#           Eric Wright (@DiscoPosse)
#
#

# Configure enviroment parameters and Turbonomic file versions
export DEBIAN_FRONTEND=noninteractive
export TURBO_URL=http://download.vmturbo.com/appliance/download/updates/5.6.4.3/update64_redhat-48507-5.6.4.3.zip
export FILLUP_URL=ftp://195.220.108.108/linux/opensuse/distribution/12.1/repo/oss/suse/x86_64/fillup-1.42-261.1.2.x86_64.rpm
export FILLUP_FILE=/tmp/fillup.rpm
export TURBO_FILE=/tmp/turbo.zip

# Update CentOS from defautl repo
yum update -y

# Update SELinux
setsebool -P httpd_can_network_connect=1

# Install unzip, wget and vim
yum install unzip wget vim -y

# Get build

wget $TURBO_URL -O $TURBO_FILE
wget $FILLUP_URL -O $FILLUP_FILE

# Install fillup
rpm -Uvh $FILLUP_FILE

# Unzip file
unzip $TURBO_FILE -d /tmp/

# Copy Repo File
cp /tmp/vmturbo_temp.repo /etc/yum.repos.d/

yum update -y 

# Install Components
yum install -y mod_ssl mariadb-server vmt-bundle

# Configure Database
echo '
[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
symbolic-links=0
innodb_file_per_table=1
innodb_buffer_pool_size = 1024M
query_cache_size = 64M
query_cache_limit = 8M

[mysqld_safe]
log-error=/var/log/mariadb/mariadb.log
pid-file=/var/run/mariadb/mariadb.pid"
!includedir /etc/my.cnf.d' | tee /etc/my.cnf

# Restart DB
service mariadb restart

# Dumb Workaround for path of SQL scripts

echo '
#!/bin/bash

echo "Running initialize_all..."

mysql -u root -pvmturbo < /srv/rails/webapps/persistence/db/create.mysql.sql
mysql -u root -pvmturbo < /srv/rails/webapps/persistence/db/grants.sql' | tee /srv/rails/webapps/persistence/db/initialize_all.sh

# Install database
sh /srv/rails/webapps/persistence/db/initialize_all.sh

# Symlink configuration
ln -s /srv/www/htdocs /srv/www/html
rm -rf /var/www/
ln -s /srv/www /var/
rm -rf /var/lib/tomcat/ /var/lib/tomcat
ln -s /srv/tomcat/ /var/lib/

# Start Turbonomic
service tomcat restart
service httpd restart

# Completion
echo "All Done - Welcome to your new Turbonomic Autonomic Platform instance"

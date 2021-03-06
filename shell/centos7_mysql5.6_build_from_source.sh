#!/bin/bash

sudo yum install -y gcc-c++ cmake openssl openssl-devel readline readline-devel ncurses-devel perl perl-devel autoconf bison

set curr_dir=`pwd`

mkdir -p ~/install/mysql/

# plan A. use local xz file
cp ../xzs/mysql-5.6.51.xz ~/install/mysql/
tar xvf mysql-5.6.51.xz

cd ~/install/mysql

# plan B. download .tar.gz file
#curl -LO https://cdn.mysql.com/archives/mysql-5.6/mysql-5.6.51.tar.gz
#curl -LO https://downloads.mysql.com/archives/get/p/23/file/mysql-5.6.51.tar.gz
#tar zxvf mysql-5.6.51.tar.gz

sudo groupadd mysql
sudo useradd -r -g mysql -s /bin/false mysql
cd mysql-5.6.51
mkdir bld
cd bld
cmake ..

make -j 8
sudo make install

cd /usr/local/mysql
sudo scripts/mysql_install_db --user=mysql

sudo mkdir /var/log/mariadb/
sudo bash -c 'echo "xxx" > /var/log/mariadb/mariadb.log'
sudo chown mysql:mysql -R /var/log/mariadb/
sudo chmod 777 /var/log/mariadb/ -R

sudo mkdir /var/run/mariadb/
sudo bash -c 'echo "xxx" > /var/run/mariadb/mariadb.pid'
sudo chown mysql:mysql -R /var/run/mariadb/
sudo chmod 777 /var/run/mariadb/ -R

sudo bin/mysqld_safe --user=mysql &

sudo cp support-files/mysql.server /etc/init.d/mysqld
sudo bash -c 'echo "export PATH=/usr/local/mysql/bin:\$PATH" >> /etc/bashrc'

sudo pkill mysqld

sudo service mysqld stop
sudo chmod 755 -R /var/lib/mysql/*
sudo chmod 755 -R /var/lib/mysql/
sudo service mysqld restart

sudo bash -c 'printf "[mysql]\nsocket=/var/lib/mysql/mysql.sock\n\n[mysql_upgrade]\n\n[mysqladmin]\nsocket=/var/lib/mysql/mysql.sock\n\n[mysqlbinlog]\n\n[mysqlcheck]\n\n[mysqldump]\n\n[mysqlimport]\n\n[mysqlshow]\n\n[mysqlslap]\n\n" > /etc/my.cnf.d/mysql-clients.cnf'

sudo bash -c 'printf "\n[mysqld]\nsocket=/var/lib/mysql/mysql.sock\n\nsql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES\n\n" > /usr/local/mysql/my.cnf'

mysql -uroot -e "delete from mysql.user where User is NULL;delete from mysql.user where User = '';delete from mysql.user where Host <> 'localhost' and Host <> '127.0.0.1';commit;flush privileges;"


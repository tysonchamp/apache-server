#!/bin/bash
#
# Auto Ubuntu Web Server Setup Script
# 
# Copyright 2014 tysonchamp <tyson.granger181@gmail.com>
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# Version 1.1
# 
# Check to see is the user is root
#
if [ $( whoami | grep root | wc -l ) != 1 ];
	then
	echo "You need to be root to properly work this script\n"
	echo "Please switch user to the root user using below command\n"
	echo "sudo su"
	exit 1
fi

# Check if user has provided the domain name
if [ -z $1 ]
	then
		echo "Provide website address without http://www. e.g sh install-setup.sh tysonchamp.com!"
		exit 1
fi

# Installing LAMP Stack & pHpMyAdmin
echo "Installing Latest Updates Process starts:"
echo " "
echo "================================================================"
apt-get update && apt-get upgrade -y
echo " "
echo "LAMP Stack with OpenSSL and phpMyAdmin"
echo "Installation Process Starts:"
echo " "
echo "================================================================"
apt-get install openssl -y && apt-get install apache2 -y
echo "================================================================"
sudo apt-get install php php-gd php-common php-curl php-gmp libapache2-mod-php -y && sudo apt-get install mariadb-server -y
echo "================================================================"
apt-get install sendmail -y
echo "================================================================"
#apt-get install phpmyadmin -y
#echo "Include /etc/phpmyadmin/apache.conf" | cat >> /etc/apache2/apache2.conf
echo "================================================================"
a2enmod rewrite
echo "Setting up Virtual Host Configaration Files"
echo " "
echo "================================================================"
sh httpconf.sh $1
mkdir /var/www/$1
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
echo "================================================================"
service apache2 restart
echo "================================================================"
echo "Installing Mongodb"
echo " "
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl enable mongod
sudo apt install php-pear -y
sudo apt -y install php-mongodb
sudo service mongod start
echo "================================================================"
# Installing SSL
echo "Want to install the Self-Sign SSL cirtificate?(yes/no):"
read bol
bol="$(echo ${bol} | tr 'A-Z' 'a-z')"

while [ -z $bol ]
do
	echo "Want to install the Self-Sign SSL cirtificate?(yes/no):"
	read bol
	bol="$(echo ${bol} | tr 'A-Z' 'a-z')"
done

if [ $bol = 'yes' ] || [ $bol = 'y' ]
    then
        echo " "
		echo "Self-Sign SSL Installation Process Starts"
		echo " "
		echo "================================================================"
		a2enmod ssl && service apache2 restart
		echo "================================================================"
		mkdir -p /etc/apache2/ssl
		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/$1.key -out /etc/apache2/ssl/$1.crt
		echo "================================================================"
		sh httpsconf.sh $1
    else if [ -n "$bol" ] || [ -z "$bol" ]
    	then
    	echo "You skiped the SSL Installation...!!"
    fi
fi
# Installing Webmin
echo "================================================================"
echo "Want to install the Webmin Control Panel?(yes/no):"
read bol
bol="$(echo ${bol} | tr 'A-Z' 'a-z')"

while [ -z $bol ]
do
	echo "Want to install the Webmin Control Panel?(yes/no):"
	read bol
	bol="$(echo ${bol} | tr 'A-Z' 'a-z')"
done

if [ $bol = 'yes' ] || [ $bol = 'y' ]
    then
        echo "Installing Webmin Control Panel and It's Dependencis"
		echo " "
		echo "================================================================"
		sh webmin.sh
    else if [ -n "$bol" ] || [ -z "$bol" ]
    	then
    	echo "You skiped the Webmin Control Panel Installation...!!"
    fi
fi
echo "Installation Complete! If you had any error contact www.tysonchamp.com or"
echo "Open a issue request on https://github.com/tysonchamp/Ubuntu-LAMP-Installer"
#
# Exit clean
#
exit 0

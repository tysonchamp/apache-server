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
# 
# 
# 
echo "Installing Latest Updates Process starts:"
echo " "
echo "================================================================"
apt-get update && apt-get upgrade -y
echo " "
echo "LAMP Stack with OpenSSL and phpMyAdmin"
echo "Installation Process Starts:"
echo " "
echo "================================================================"
apt-get install apache2 php5 openssl -y && apt-get install mysql-server -y && apt-get install phpmyadmin -y
#echo "Include /etc/phpmyadmin/apache.conf" | cat >> /etc/apache2/apache2.conf
a2enmod ssl && service apache2 restart
echo " "
echo "Self-Sign SSL Installation Process Starts"
echo " "
echo "================================================================"
mkdir -p /etc/apache2/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/$1.key -out /etc/apache2/ssl/$1.crt
a2enmod rewrite
echo "Setting up Virtual Host Configaration Files"
echo " "
echo "================================================================"
sh vhostconf.sh
mkdir /var/www/$1
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
echo "Installing Webmin Control Panel and It's Dependencis"
echo " "
echo "================================================================"
sh webmin.sh

#!/bin/bash

if [ -e /etc/apache2/sites-available/default-ssl.conf.backup ]
	then
		if [ -e /etc/apache2/sites-available/default-ssl.conf ]
			then
				echo "<IfModule mod_ssl.c>" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "    <VirtualHost _default_:443>" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        ServerAdmin admin@$1" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        ServerName $1" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        ServerAlias www.$1" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        DocumentRoot /var/www/$1" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "	      <Directory /var/www/>" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "	      Options Indexes FollowSymLinks MultiViews" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "	      # changed from None to FileInfo" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "	      AllowOverride FileInfo" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "	      Order allow,deny" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "	      allow from all" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "	      </Dirctory>" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        ErrorLog ${APACHE_LOG_DIR}/error.log" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        CustomLog ${APACHE_LOG_DIR}/access.log combined" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        SSLEngine on" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        SSLCertificateFile /etc/apache2/ssl/$1.crt" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        SSLCertificateKeyFile /etc/apache2/ssl/$1.key" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "    </VirtualHost>" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "</IfModule>" | cat >> /etc/apache2/sites-available/default-ssl.conf
			else
				touch /etc/apache2/sites-available/default-ssl.conf
				echo "<IfModule mod_ssl.c>" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "    <VirtualHost _default_:443>" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        ServerAdmin admin@$1" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        ServerName $1" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        ServerAlias www.$1" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        DocumentRoot /var/www/$1" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "	      <Directory /var/www/>" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "	      Options Indexes FollowSymLinks MultiViews" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "	      # changed from None to FileInfo" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "	      AllowOverride FileInfo" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "	      Order allow,deny" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "	      allow from all" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "	      </Dirctory>" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        ErrorLog ${APACHE_LOG_DIR}/error.log" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        CustomLog ${APACHE_LOG_DIR}/access.log combined" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        SSLEngine on" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        SSLCertificateFile /etc/apache2/ssl/$1.crt" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "        SSLCertificateKeyFile /etc/apache2/ssl/$1.key" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "    </VirtualHost>" | cat >> /etc/apache2/sites-available/default-ssl.conf
				echo "</IfModule>" | cat >> /etc/apache2/sites-available/default-ssl.conf
		fi
	else
		mv /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.backup
		touch /etc/apache2/sites-available/default-ssl.conf
		echo "<IfModule mod_ssl.c>" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "    <VirtualHost _default_:443>" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "        ServerAdmin admin@$1" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "        ServerName $1" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "        ServerAlias www.$1" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "        DocumentRoot /var/www/$1" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "	      <Dirctory /var/www/>" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "	      Options Indexes FollowSymLinks MultiViews" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "	      # changed from None to FileInfo" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "	      AllowOverride FileInfo" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "	      Order allow,deny" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "	      allow from all" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "	      </Directory>" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "        ErrorLog ${APACHE_LOG_DIR}/error.log" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "        CustomLog ${APACHE_LOG_DIR}/access.log combined" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "        SSLEngine on" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "        SSLCertificateFile /etc/apache2/ssl/$1.crt" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "        SSLCertificateKeyFile /etc/apache2/ssl/$1.key" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "    </VirtualHost>" | cat >> /etc/apache2/sites-available/default-ssl.conf
		echo "</IfModule>" | cat >> /etc/apache2/sites-available/default-ssl.conf
fi

service apache2 restart

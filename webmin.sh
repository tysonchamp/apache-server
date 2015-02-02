#!/bin/bash
echo "deb http://download.webmin.com/download/repository sarge contrib" | cat >> /etc/apt/sources.list
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc
apt-get update && apt-get install webmin -y

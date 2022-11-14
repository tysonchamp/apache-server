#!/bin/bash
echo "deb https://download.webmin.com/download/repository sarge contrib" | cat >> /etc/apt/sources.list
wget https://download.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc
apt-get update && apt-get install webmin -y

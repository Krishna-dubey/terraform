#! /bin/bash
sudo apt-get update -y
sudo wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum localinstall -y mysql57-community-release-el7-11.noarch.rpm 
sudo yum install -y mysql-community-server
sudo systemctl start mysqld.service


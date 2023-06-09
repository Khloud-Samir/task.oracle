#!/bin/bash

# Install Apache
sudo yum install httpd -y

# Start Apache
sudo systemctl start httpd.service

# Enable Apache to start on boot
sudo systemctl enable httpd.service

# Open port 80 in the firewall
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --reload

sudo su
echo 'HI khloud' >/var/www/html/index.html
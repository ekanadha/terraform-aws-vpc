#!/bin/bash
yum update -y
sudo amazon-linux-extras install nginx1
systemctl start nginx1
systemctl start nginx
systemctl status nginx
systemctl enable nginx
echo "Hello World " >/usr/share/nginx/html/index.html
              
#!/bin/bash
# User Data script to install Apache web server on EC2 instances

yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd

echo "<h1>Welcome to Apache on EC2 Instance ID: $(curl -s http://169.254.169.254/latest/meta-data/instance-id)</h1>" > /var/www/html/index.html

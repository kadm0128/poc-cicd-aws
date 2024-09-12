#!/bin/bash 
# Update package lists 
yum update -y 

# Install Nginx 
yum install -y nginx 

# Stop and disable default service (optional) 
systemctl stop nginx 
systemctl disable nginx 

# Create a custom welcome message file 
echo "Welcome to Presentation Tier EC2 instance in Availability Zone B." > /usr/share/nginx/html/index.html 

# Start and enable the Nginx service 
systemctl start nginx 
systemctl enable nginx

# Install code deploy agent
sudo yum install ruby -y
sudo yum install wget -y
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo systemctl start codedeploy-agent
#!/bin/bash

sudo yum update -y

sudo yum install httpd -y

sudo systemctl start httpd

sudo systemctl enable httpd

sudo echo "<html>" > /var/www/html/index.html
sudo echo "<h1>Welcome to Terraform EC2 Server</h1>" >> /var/www/html/index.html
sudo echo "<h2>Apache Installed Successfully</h2>" >> /var/www/html/index.html
sudo echo "<h3>UserData Executed Successfully</h3>" >> /var/www/html/index.html
sudo echo "</html>" >> /var/www/html/index.html

sudo systemctl restart httpd

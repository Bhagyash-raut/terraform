#!/bin/bash
# Provisioning script: installs nginx and writes a simple index page
set -e

if command -v yum >/dev/null 2>&1; then
  yum update -y
  yum install -y nginx
  systemctl enable --now nginx
elif command -v apt-get >/dev/null 2>&1; then
  apt-get update -y
  DEBIAN_FRONTEND=noninteractive apt-get install -y nginx
  systemctl enable --now nginx
fi

echo "<html><body><h1>Hello from Terraform provisioner</h1></body></html>" > /usr/share/nginx/html/index.html

exit 0

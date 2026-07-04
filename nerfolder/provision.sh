#!/bin/bash
# Simple provision script for Terraform local-exec.
# Writes the instance private IP into private_ips.txt.

if [ -z "$1" ]; then
  echo "Usage: $0 <private_ip>"
  exit 1
fi

PRIVATE_IP="$1"

echo "Provisioning instance with private IP: $PRIVATE_IP"
echo "$PRIVATE_IP" >> private_ips.txt

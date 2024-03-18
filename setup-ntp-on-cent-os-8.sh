#!/bin/bash
#
# setup-ntp-on-cent-os-8.sh
# Purpose: Installs the NTP daemon and enables it on CentOS 8.
#
# Copyright (c) 2024 [Your Name]
# This software/script is released under the terms of the MIT license (http://en.wikipedia.org/wiki/MIT_License).
# 
# INSTRUCTIONS FOR USE:
# 1. Copy this shell script to your home directory or the /tmp directory.
# 2. Make it executable with the following command: 
#      chmod a+x setup-ntp-on-cent-os-8.sh
# 3. Execute the script as a sudo user:
#      sudo ./setup-ntp-on-cent-os-8.sh

echo ""
echo "Starting..."
MYDATE=$(date -R)
echo "The date on your server BEFORE any changes: $MYDATE";

RELEASE=$(cat /etc/redhat-release)
isCentOs8=false

if [[ $RELEASE == *"CentOS Linux release 8"* ]]; then
    isCentOs8=true
fi

# Install and set-up NTP daemon:
if [ "$isCentOs8" == true ]; then
    echo "I am CentOS 8"
    echo ""

    sudo yum install ntp -y > /dev/null
    sudo firewall-cmd --add-service=ntp --permanent
    sudo firewall-cmd --reload

    sudo systemctl start ntpd
fi

echo ""
echo "Finished with setup"
echo "The date on your server AFTER any changes: $MYDATE";
echo "If you do not see any changes before the BEFORE and AFTER values, wait a few minutes for NTP to pool its time servers and then try this command: date -R"
echo ""

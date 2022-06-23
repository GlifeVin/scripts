#!/bin/sh
sudo usermod -a -G tty `whoami`
sudo usermod -a -G dialout `whoami`

# check user group should contains tty and dialout
groups


# Modify cups config
sudo sed -i "s/JobPrivateAccess\sdefault/JobPrivateAccess all/g" /etc/cups/cupsd.conf
sudo sed -i "s/JobPrivateValues\sdefault/JobPrivateValues none/g" /etc/cups/cupsd.conf

sudo service cups restart
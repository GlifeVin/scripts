#!/bin/sh

PRINTER_NAME=GP-3150TN
PRINTER_URI=`lpstat -v | grep $PRINTER_NAME | sed 's/^.*usb:/usb:/g'`
if [! -e /tmp/wms/Gprinter.ppd ]
then
  sudo mkdir -p /tmp/wms/
  curl https://raw.githubusercontent.com/GlifeVin/scripts/main/wms/Gprinter.ppd > /tmp/wms/Gprinter.ppd
fi

sudo /usr/sbin/lpadmin -p $PRINTER_NAME -E -v $PRINTER_URI -m /tmp/wms/Gprinter.ppd -o printer-is-shared=false

# config
sudo lpadmin -p $PRINTER_NAME -o usb-no-reattach=true
sudo lpadmin -p $PRINTER_NAME -o usb-unidir=true
sudo service cups restart

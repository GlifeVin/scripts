#!/bin/sh

PRINTER_NAME="GP-3150TN"
PRINTER_URI=`lpstat -v | grep $PRINTER_NAME | sed 's/^.*usb:/usb:/g'`

if [ ! -e ~/tmp/wms/Gprinter.ppd ]
then
  sudo mkdir -p ~/tmp/wms
  curl https://raw.githubusercontent.com/GlifeVin/scripts/main/wms/Gprinter.ppd > ~/tmp/wms/Gprinter.ppd
fi

if [ ! -e ~/tmp/wms/rastertotspl ]
then
  sudo mkdir -p ~/tmp/wms
  curl https://raw.githubusercontent.com/GlifeVin/scripts/main/wms/rastertotspl > ~/tmp/wms/rastertotspl
  sudo mv ~/tmp/wms/rastertotspl /usr/lib/cups/filter/rastertotspl
fi

echo "Printer $PRINTER_NAME"
echo "Printer uri $PRINTER_URI"

sudo /usr/sbin/lpadmin -p $PRINTER_NAME -E -v $PRINTER_URI -P ~/tmp/wms/Gprinter.ppd

# config
sudo lpadmin -p $PRINTER_NAME -o usb-no-reattach=true
sudo lpadmin -p $PRINTER_NAME -o usb-unidir=true
sudo service cups restart

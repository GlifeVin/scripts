#!/bin/sh

PRINTER_NAME="GP-3150TN"
PRINTER_URI=`lpstat -v | grep $PRINTER_NAME | sed 's/^.*usb:/usb:/g'`

if [ ! -e ~/wms/Gprinter.ppd ]
then
  sudo mkdir -p ~/wms
  sudo chown `whoami`:`whoami` ~/wms
  curl https://raw.githubusercontent.com/GlifeVin/scripts/main/wms/Gprinter.ppd > ~/wms/Gprinter.ppd
fi

if [ ! -e ~/wms/rastertotspl ]
then
  sudo mkdir -p ~/wms
  sudo chown `whoami`:`whoami` ~/wms
  curl https://raw.githubusercontent.com/GlifeVin/scripts/main/wms/rastertotspl > ~/wms/rastertotspl
  sudo cp ~/wms/rastertotspl /usr/lib/cups/filter/rastertotspl
  sudo chown root:root /usr/lib/cups/filter/rastertotspl
  sudo chmod 755 /usr/lib/cups/filter/rastertotspl
fi

echo "Printer $PRINTER_NAME"
echo "Printer uri $PRINTER_URI"

sudo /usr/sbin/lpadmin -p $PRINTER_NAME -E -v $PRINTER_URI -P ~/wms/Gprinter.ppd -o usb-no-reattach=true -o usb-unidir=true

sudo service cups restart

# cleanup
sudo rm -rf ~/wms
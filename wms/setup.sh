#!/bin/sh
# Setup node env
curl https://raw.githubusercontent.com/GlifeVin/scripts/main/wms/node_env.sh | bash

# Reconfig system
curl https://raw.githubusercontent.com/GlifeVin/scripts/main/wms/system_config.sh | bash

# Config CUPS and Printer
curl https://raw.githubusercontent.com/GlifeVin/scripts/main/wms/printer_config.sh | bash
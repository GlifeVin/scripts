#!/bin/sh
# load nvm env
source $NVM_DIR/nvm.sh

sudo usermod -a -G tty `whoami`
sudo usermod -a -G dialout `whoami`

# check user group should contains tty and dialout
groups


#!/bin/sh

# install packages
sudo apt-get install -y build-essential curl git cups vim

# install nvm
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.bashrc

# load nvm env
source $NVM_DIR/nvm.sh

# install nodejs + yarn
nvm install v14.16.0
nvm use v14.16.0
npm i -g corepack
npm i -g pm2

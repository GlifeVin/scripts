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

# remove symlink before install new one
rm -rf $NVM_BIN/corepack
npm i -g corepack # install yarn

npm i -g pm2

sudo env PATH=$PATH:$NVM_BIN pm2 startup systemd -u `whoami` --hp $HOME
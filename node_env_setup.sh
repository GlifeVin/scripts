# /usr/bin/bash

# install packages
sudo apt-get install -y build-essential curl git cups vim

# install nvm
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.bashrc

# install node + yarn
nvm install v14.16.0
nvm use v14.16.0
npm i -g corepack
npm i -g pm2

yarn install

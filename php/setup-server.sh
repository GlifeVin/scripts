# this is setup-server.sh file to setup server dependencies to serve nginx and php7.4-fpm

# update server
echo 'Upgrade server...'
sudo apt-get update -y
sudo apt-get upgrade -y

# install dev deps
echo 'Install dependencies...'
sudo apt-get install -y rsync git wget zip unzip openssl software-properties-common apt-transport-https autoconf bison build-essential libssl-dev libyaml-dev libreadline-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev

# install nginx
echo 'Install nginx...'
sudo apt-get install -y nginx nginx-extras nginx-common

# install php7.4-fpm and extentions
echo 'Install php7.4...'
sudo apt-get install -y php7.4 php7.4-fpm php7.4-cli php7.4-mysql php7.4-curl php7.4-json php7.4-mbstring php7.4-intl

# enable startup
echo 'Enable startup...'
sudo systemctl enable nginx
sudo systemctl enable php7.4-fpm

# install Composer
echo 'Install Composer...'
cd ~
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo 'Setup all done.'

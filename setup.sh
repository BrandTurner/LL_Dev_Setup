#!/bin/bash
# This is my first crack at automating our dev processes. This script
# handles onboarding. Initially developed by Cliff, I've heavily modified 
# and streamlined the on-boarding processes.

# TODO Create an installation log
# TODO use which git or whatever to find if install was successful. If not, exit program?

# TODO: Add check to see if GIT exists
# Downloads git
cd $HOME/Downloads
wget https://git-osx-installer.googlecode.com/files/git-1.8.3.2-intel-universal-snow-leopard.dmg

# Get name of the present volume, needed for package installer
folder=`pwd`						
full_volume_path=$(ls /Volumes/*/$folder/git-1.8.3.2-intel-universal-snow-leopard.dmg)
IFS='/' read -r empty vol vol_name path <<< "$full_volume_path"
volume_name="/$vol/$vol_name/"

hdiutil mount git-1.8.3.2-intel-universal-snow-leopard.dmg
sudo installer -package /Volumes/Git\ 1.8.3.2\ Snow\ Leopard\ Intel\ Universal/git-1.8.3.2-intel-universal-snow-leopard.pkg -target ${volume_name}
cd $HOME
hdiutil unmount "/Volumes/Git\ 1.8.3.2\ Snow\ Leopard\ Intel\ Universal/"
# Git Setup

# INSTALL Node and npm - Cuz it's the future
# Should be in home directory
cd $HOME
mkdir node-install
cd node-install
git clone git://github.com/ry/node.git
# install npm
curl http://npmjs.org/install.sh | sh

npm install osx

# INSTALL CURL
cd $HOME/Downloads
wget http://curl.haxx.se/download/curl-7.32.0.tar.gz
gunzip -c curl-7.32.0.tar.gz | tar -xopf -
cd curl-7.32.0
# will prompt user for password at this point
make && sudo make install
# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

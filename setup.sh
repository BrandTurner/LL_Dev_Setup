#!/bin/bash
# This is my first crack at automating our dev processes. This script
# handles onboarding. Initially developed by Cliff, I've heavily modified 
# and streamlined the on-boarding processes.

# Should I consider using a package manager for the installation process?
# Did it the hard way, now to use OSS
# Install Homebrew, the package manager for OS X
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# Install wget, great alternative to cURL
brew install wget

# Installs git, may use the package instead of brew
brew install git

# Homebrew installs git to /usr/local/bin while the default install is @ /usr/bin
# Updates path
export PATH="/usr/local/bin:$PATH"

# Install node.js
# Required for the awesome git branch viewer, ungit
brew install node

# Install Node Package Manager(NPM)
curl http://npmjs.org/install.sh | sh

# Since Homebrew was used to install this script, we need to point the NODE_PATH to the correct location
# to find Node Modules. Also, need to amend $PATH since some Node modules execute files
export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:$PATH"

# Install nvm: node-version-manager
# https://github.com/creationix/nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production version node
source $HOME/.nvm/nvm.sh
nvm install 0.10
nvm use 0.10

# Download and install the dotfiles

# After dotfiles are downloaded, download the repos

# git pull and install dotfiles
# cd $HOME
# if [-d ./dotfiles/ ]; then
# 	mv dotfiles dotfiles.old
# fi
# git clone https://github.com/sameple/dotfiles.git
# ln -sb dotfiles/.screenrc .
# ln -sb dotfiles/.bash_profile .
# ln -sb dotfiles/.bashrc .
# ln -sb dotfiles/.bashrc_custom .
# ln -sb dotfiles/.emacs.d .

# Install jshint to allow checking of JS code within emacs
# http://jshint.com
#npm install -g jshint


# TODO Create an installation log
# TODO use which git or whatever to find if install was successful. If not, exit program?

# TODO: Add check to see if GIT exists
# Downloads git

# Installs wget via cURL
# http://crosstown.coolestguyplanettech.com/os-x/32-install-and-configure-wget-on-os-x-lion-107
# cd $HOME/Downloads
# curl -O http://ftp.gnu.org/gnu/wget/wget-1.14.tar.gz
# tar -xzvf wget-1.14.tar.gz
# cd wget-1.14
# ./configure --with-ssl=openssl
# make
# sudo make install
# Clean up the wget installation
# rm -rf $HOME/Downloads/wget*

# Install git
# http://git-scm.com/downloads
# cd $HOME/Downloads
# wget https://git-osx-installer.googlecode.com/files/git-1.8.3.2-intel-universal-snow-leopard.dmg
# folder=`pwd`						
# full_volume_path=$(ls /Volumes/*/$folder/git-1.8.3.2-intel-universal-snow-leopard.dmg)
# IFS='/' read -r empty vol vol_name path <<< "$full_volume_path"
# volume_name="/$vol/$vol_name/"
# hdiutil mount git-1.8.3.2-intel-universal-snow-leopard.dmg
# sudo installer -package /Volumes/Git\ 1.8.3.2\ Snow\ Leopard\ Intel\ Universal/git-1.8.3.2-intel-universal-snow-leopard.pkg -target ${volume_name}
# cd $HOME
# hdiutil unmount "/Volumes/Git\ 1.8.3.2\ Snow\ Leopard\ Intel\ Universal/"
# Git Setup

# INSTALL Node and npm - Cuz it's the future
# Should be in home directory
# cd $HOME
# mkdir node-install
# cd node-install
# git clone git://github.com/ry/node.git
# install npm
# curl http://npmjs.org/install.sh | sh

# npm install osx

# INSTALL CURL - Apparently, cURL comes installed on OS X by default but not wget
# cd $HOME/Downloads
# wget http://curl.haxx.se/download/curl-7.32.0.tar.gz
# gunzip -c curl-7.32.0.tar.gz | tar -xopf -
# cd curl-7.32.0
# will prompt user for password at this point
# make && sudo make install
# Install nvm: node-version manager
# https://github.com/creationix/nvm
# sudo apt-get install -y git
# sudo apt-get install -y curl
# curl https://raw.github.com/creationix/nvm/master/install.sh | sh

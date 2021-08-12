#!/bin/bash

function aptInstall() {
  which $1 &>/dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt-get install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# function snapInstall {
#   which $1 &> /dev/null

#   if [ $? -ne 0 ]; then
#     echo "Installing: ${1}..."
#     apt-get install -y $1
#   else
#     echo "Already installed: ${1}"
#   fi
# }

aptInstall git
aptInstall gdebi-core
aptInstall curl
aptInstall make
aptInstall diodon


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# vscode

# ppa
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# install
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code

# set vscode as default text editor
sudo update-alternatives --set editor /usr/bin/code #optional

# "Visual Studio Code is unable to watch for file changes in this large workspace" (error ENOSPC)
# cat /proc/sys/fs/inotify/max_user_watches
sudo -- bash -c '(echo "fs.inotify.max_user_watches=524288") >> /etc/sysctl.conf'
sudo sysctl -p

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# chrome
wget -c -nc https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo gdebi -n ./google-chrome-stable_current_amd64.deb

# slack
wget -c -nc https://downloads.slack-edge.com/linux_releases/slack-desktop-4.4.2-amd64.deb && sudo gdebi -n ./slack-desktop-4.4.2-amd64.deb

# zoom
wget -c -nc https://zoom.us/client/latest/zoom_amd64.deb && sudo gdebi -n ./zoom_amd64.deb

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# hyper

# stable
wget -c -nc https://releases.hyper.is/download/deb -o hyper.deb && sudo gdebi -n ./hyper*.deb

# set hyper as default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /opt/Hyper/hyper 50 #optional

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# alacritty
# sudo add-apt-repository ppa:mmstick76/alacritty
# sudo apt-get update
# aptInstall alacritty

# zsh
aptInstall zsh

# oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# zgen
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# Make zsh default shell
chsh -s $(which zsh)

# open terminal to continue installing zsh
hyper &

aptInstall vim
aptInstall gdebi-core
aptInstall gnome-tweaks
aptInstall redis-server

#fonts
aptInstall fonts-firacode

# NodeJs using n
# make cache folder (if missing) and take ownership
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
# make sure the required folders exist (safe to execute even if they already exist)
sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
# take ownership of Node.js install destination folders
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share

# install LTS version of NodeJs 
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
bash n lts


# Docker #Method 1
aptInstall docker.io
sudo usermod -aG docker $USER
newgrp docker 


# Docker #Method 2
# CURRENT_USER=$USER
# curl -fsSL https://get.docker.com -o get-docker.sh
# sudo sh get-docker.sh
# sudo usermod -aG docker $CURRENT_USER

# mongodb
# wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
# echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
# sudo apt-get update
# aptInstall mongodb-org
# sudo systemctl enable mongod

# snap
sudo snap install aws-cli --classic
sudo snap install vlc

# saw
wget -c -nc https://github.com/TylerBrock/saw/releases/download/v0.2.2/saw_0.2.2_linux_amd64.deb && sudo gdebi -n ./saw*.deb

# studio3t
# wget -c -nc https://download.studio3t.com/studio-3t/linux/2020.5.0/studio-3t-linux-x64.tar.gz && tar -xvzf studio-3t-linux-x64.tar.gz && sh ./studio-3t-linux-x64.sh

# npm
sudo npm i -g npm@latest
sudo npm i -g nodemon
sudo npm i -g @angular/cli
# sudo npm i -g serverless@1.52.0
sudo npm i -g @nrwl/cli
sudo npm i -g eslint
# sudo npm i -g pm2
# sudo npm i -g stylelint
# sudo npm i -g stylelint-config-standard
# sudo npm i -g stylelint-prettier
sudo npm i -g prettier

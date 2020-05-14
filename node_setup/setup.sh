#!/bin/bash

apt update

# install some useful stuff
apt install -y \
  sudo \
  curl \
  vim \
  less \
  htop \
  atop \
  screen \
  tmux \
  git

# fix sudoers
sed -i "s/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/" /etc/sudoers

# fix .bashrc
sed -i "s/#alias ll='ls -l'/alias ll='ls -lah'/" /etc/skel/.bashrc
cp -f /etc/skel/.bashrc /root/.bashrc
source /root/.bashrc


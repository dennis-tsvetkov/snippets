#!/bin/bash

apt update

# install some useful stuff
apt install -y \
  sudo \
  vim \
  less \
  htop \
  atop \
  screen \
  tmux \
  git

# fix sudoers
sed -i "s/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/" /etc/sudoers



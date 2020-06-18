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
  net-tools \
  iotop \
  iftop \
  tmux \
  git

# fix sudoers
sed -i "s/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/" /etc/sudoers

# fix .bashrc
echo -e "
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
" >> /etc/skel/.bashrc

echo 'export PS1="\[\e[37m\]\u@\h\[\e[m\]:\[\033[1;34m\]\w\[\033[0;33m\]$(parse_git_branch)\[\033[00m\] $ "' >> /etc/skel/.bashrc
echo 'shopt -s histappend' >> /etc/skel/.bashrc
sed -i "s/#alias ll='ls -l'/alias ll='ls -lah'/" /etc/skel/.bashrc
cp -f /etc/skel/.bashrc /root/.bashrc

# get vimcolors
cd ~
git clone https://github.com/dennis-tsvetkov/vimcolors.git
cd vimcolors
bash ./install.sh
cd ~
cp -r ~/.vim /etc/skel/
cp ~/.vimrc /etc/skel/


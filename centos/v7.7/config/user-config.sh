#!/bin/bash

echo "set -o vi" >> ~/.bashrc
echo "LC_ALL=en_US.UTF-8" >> ~/.bashrc
echo "export PS1='[\u@\h \W]\$ '" >> ~/.bashrc
echo "cd ~" >> ~/.bashrc

cd ~
ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''


#!/bin/bash -x

####################
# set user-config
#echo "$USER:$USER" | chpasswd
#echo "$USER" | su $USER

# ssh config
echo "set -o vi" >> ~/.bashrc
echo "LC_ALL=en_US.UTF-8" >> ~/.bashrc
echo "cd ~" >> ~/.bashrc

cd ~
ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''

# after login
# ssh-copy-id <hostname>
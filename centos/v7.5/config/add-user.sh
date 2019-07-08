#!/bin/bash -x

USER=$1

## add user
useradd -m -s /bin/bash -p $USER $USER
cp -pr /home/vagrant/.ssh /home/$USER/
chown -R $USER:$USER /home/$USER
echo "%$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER

# install open jdk
yum install java-1.8.0-openjdk-devel -y

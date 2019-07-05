#!/bin/bash -x

## add ecube
useradd -m -s /bin/bash -p ecube ecube
cp -pr /home/vagrant/.ssh /home/ecube/
chown -R ecube:ecube /home/ecube
echo "%ecube ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ecube

# install open jdk
yum install java-1.8.0-openjdk-devel -y

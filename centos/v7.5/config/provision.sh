#!/bin/bash -x

user=$1

####################
## add user
useradd -m -s /bin/bash -p $user $user
echo "$user:$user" | chpasswd
cp -pr /home/vagrant/.ssh /home/$user/
chown -R $user:$user /home/$user
echo "%$user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$user

####################
# prevent access with plaintext password
sed -i -e "\\#PasswordAuthentication no# s#PasswordAuthentication no#PasswordAuthentication yes#g" /etc/ssh/sshd_config
service sshd restart

####################
# disable firewalld
systemctl stop firewalld
systemctl disable firewalld

####################
# install openjdk
yum install java-1.8.0-openjdk-devel -y

####################
# install Docker
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
usermod -aG docker ecube
systemctl start docker.service
systemctl enable docker.service

####################
# create data directory
mkdir -p /data/prod/zookeeper
mkdir -p /data/prod/kafka
mkdir -p /data/logs/zookeeper
mkdir -p /data/logs/kafka

chown -R $user:$user /data/*

####################
# modify first line in /etc/hosts
# HostNotFoundExceptiopn in zookeeper
sed -i -e "s/127.0.0.1      cent/#127.0.0.1      cent/" /etc/hosts

####################
# modify user defined
if [ -d "/home/vagrant/install" ]; then
    cp -r /home/vagrant/install /home/$user/install
fi
cp -r /home/vagrant/config /home/$user/config
chown -R $user:$user /home/$user
su -c "source /home/$user/config/user-config.sh" $user

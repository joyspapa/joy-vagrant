#!/bin/bash -x

user=$1

#export DEBIAN_FRONTEND=noninteractive

# set timezone by Asia/Seoul
if [ -f "/etc/localtime" ]; then
	/usr/bin/rm /etc/localtime
fi
/usr/bin/ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime


groupadd -g 1001 scom
useradd -m -d /home/$user -s /bin/bash -p $user -u 609 -g 1001 $user 

echo "$user:$user" | chpasswd
echo "$user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user

# aloow access with plaintext password
sed -i -e "\\#PasswordAuthentication no# s#PasswordAuthentication no#PasswordAuthentication yes#g" /etc/ssh/sshd_config
/usr/sbin/service sshd restart

# login re-directly to the user
#su -c "echo 'sudo su ecube' >> /home/vagrant/.bashrc" vagrant

##############################################################
# (only for SSG-project) Install Zulu JDK
##############################################################
#1.Import Azul's public key.
/usr/bin/rpm --import http://repos.azulsystems.com/RPM-GPG-KEY-azulsystems
#2.Add the Azul package to the yum repository.
/usr/bin/curl -o /etc/yum.repos.d/zulu.repo http://repos.azulsystems.com/rhel/zulu.repo
#3.Install Zulu by using a repository.
/usr/bin/yum install zulu-8 -y

# copy installation directories to /home/$user
#if [ -d "/home/vagrant/install" ]; then
#    cp -r /home/vagrant/install /home/$user/install
#fi

# create base root directories for SSG.com
mkdir -p /data01/{sw,logs} /appdata
chown -R ecube:ecube /data01

# user configuration
cp -r /home/vagrant/config /home/$user/config
chown -R $user:$user /home/$user/config
su -c "source /home/$user/config/user-config.sh" $user

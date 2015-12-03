#!/bin/sh

sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade
sudo adduser vagrant sudo
sudo adduser vagrant root
sudo echo "vagrant ALL=(ALL:ALL) ALL" >> /etc/sudoers
sudo echo "stack ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo apt-get -y install python-setuptools build-essential python-dev python3-dev libxml2-dev libxslt-dev lib32z1-dev git python-pip python-virtualenv 
sudo easy_install pip
sudo pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U
sudo apt-get -y autoremove python-six
git clone http://git.openstack.org/openstack-dev/devstack /home/vagrant/devstack
sudo chmod 777 -R /home/vagrant/devstack
sudo wget http://openvswitch.org/releases/openvswitch-2.3.2.tar.gz
sudo tar zxvf openvswitch-2.3.2.tar.gz
cd openvswitch-2.3.2
sudo apt-get -y install dh-autoreconf libssl-dev openssl build-essential fakeroot graphviz python-all python-qt4 python-twisted-conch
sudo DEB_BUILD_OPTIONS='parallel=8 nocheck' fakeroot debian/rules binary
cd ..
sudo dpkg -i openvswitch-common* openvswitch-switch*



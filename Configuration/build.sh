#!/bin/sh
sudo /bin/su - vagrant -c "/home/vagrant/devstack/stack.sh"
#sudo /bin/su - vagrant -c "/opt/stack/tempest/run_tempest.sh tempest.api.network" >> /home/vagrant/test.txt 2>&1

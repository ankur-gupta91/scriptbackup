#!/bin/sh
cd /opt/stack/tempest
testr init
sudo python setup.py install
sudo easy_install pip
sudo pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U
sudo apt-get autoremove -y python-six

testr run tempest.scenario.test_network_advanced_server_ops --subunit | subunit-trace --no-failure-debug -f
sudo mkdir /home/vagrant/results/advops
sudo mkdir /home/vagrant/results/advops/logs
subunit2html .testrepository/0 /home/vagrant/results/advops/advserveropsresults.html
sudo chmod 755 /home/vagrant/results/advops/advserveropsresults.html

sudo chmod 777 -R /opt/stack/logs
sudo rm -rf /home/vagrant/results/advops/logs
sudo cp -R /opt/stack/logs /home/vagrant/results/advops/logs



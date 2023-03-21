#!/bin/bash
wget https://apt.puppet.com/puppet-tools-release-focal.deb /tmp/puppet-tools-release-focal.deb
dpkg -i /tmp/puppet-tools-release-focal.deb
apt-get update
apt-get install -y puppet-bolt
apt-get install -y qemu-guest-agent
mkdir /root/spectro_install
cd /root/spectro_install
bolt project init spectro_mysql --modules puppetlabs-mysql
mkdir /root/spectro_install/plans
curl "https://raw.githubusercontent.com/spectrocloud-labs/puppet-plans/main/spectro_mysql/init.pp" -o /root/spectro_install/plans/init.pp
cd /root/spectro_install
bolt plan run spectro_mysql
systemctl start qemu-guest-agent

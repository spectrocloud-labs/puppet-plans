#!/bin/bash
wget https://apt.puppet.com/puppet-tools-release-focal.deb -O /tmp/puppet-tools-release-focal.deb
dpkg -i /tmp/puppet-tools-release-focal.deb
apt-get update
apt-get install -y puppet-bolt qemu-guest-agent
mkdir /root/spectro_install
cd /root/spectro_install
bolt project init spectro_hybrid --modules puppetlabs-postgresql
mkdir /root/spectro_install/plans
curl "https://raw.githubusercontent.com/spectrocloud-labs/puppet-plans/main/spectro_hybrid/init.pp" -o /root/spectro_install/plans/init.pp
cd /root/spectro_install
bolt plan run spectro_hybrid
wget https://raw.githubusercontent.com/dockersamples/wordsmith/main/db/words.sql -O /tmp/words.sql
sudo -u postgres psql -d postgres < /tmp/words.sql
systemctl start qemu-guest-agent

#!/bin/bash
#
# This script will make a best-effort attempt to revert an installed
# build node or OpenStack node to a basic Ubuntu install similar to
# what a system looks like immediately after a minimal Ubuntu LTS
# deployment
#
# It is intended primarily for use when doing testing. Installing on
# fresh Ubuntu installs is the preferred target for deployment
#

echo ""
echo "Uninstalling OpenStack and Cobbler packages"
echo ""

apt-get purge -y `dpkg -l | awk '{ print $2 }' | grep -E '(openstack|ceilometer|ceph|cinder|glance|heat|horizon|keystone|neutron|nova|swift|nagios|collectd|cobbler|dnsmasq|puppet|passenger|apache2|mysql|galera|apt-cacher-ng|mongodb|git|openvswitch|postgresql|python2.7-dev|qemu|rabbitmq|erlang|ruby|build-essential|dpkg-dev|xinetd|x11|xfsprogs|haproxy|keepalived|memcached|augeas|zope|twisted)'`

apt-get --purge autoremove -y

echo ""
echo "Removing stale configuration files"
echo ""

rm -rf /etc/mysql /var/lib/mysql /var/lib/puppet /var/lib/cobbler \
  /root/.my.cnf /etc/nagios3 /etc/nagios /var/www/index.html \
  /var/www/header-logo.png /etc/cobbler /etc/apache2 /var/lib/ceilometer \
  /var/lib/heat /var/lib/cinder /var/lib/glance /var/lib/nova \
  /var/lib/keystone /etc/keystone /var/lib/neutron /etc/swift \
  /var/cache/swift /var/lib/mongodb /etc/xinetd.d

echo ""
echo "Node reset completed - please reboot before reusing"
echo ""

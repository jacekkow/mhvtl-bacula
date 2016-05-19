#!/bin/sh 

# update the system
yum update -y

# close the selinux and the firewall
chkconfig iptables off
service iptables stop
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
/usr/sbin/setenforce 0

# install Git
yum install -y git

# install supported Rpms
yum install -y gcc gcc-c++ make kernel-devel zlib-devel sg3_utils lsscsi mt-st mtx  lzo lzo-devel

# create user, group and folders
/usr/sbin/groupadd -r vtl
/usr/sbin/useradd -r -c "Vitrual Tape Library" -d /opt/mhvtl -g vtl vtl
mkdir -p /opt/mhvtl
mkdir -p /etc/mhvtl
chown -Rf vtl:vtl /opt/mhvtl
chown -Rf vtl:vtl /etc/mhvtl

echo "reboot is necessary now to update kernel"

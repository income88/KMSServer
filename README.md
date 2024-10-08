#!/bin/sh
# KMSServer
sed -i.bak 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i.bak 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
cd /tmp/ && yum install git -y && git clone https://github.com/income88/KMSServer && cd KMSServer/ && sed -i -e 's/\r$//' InstallKMS.sh && chmod 755 InstallKMS.sh && ./InstallKMS.sh

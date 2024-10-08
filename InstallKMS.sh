#!/bin/sh
yum update -y && yum install curl wget nano screen git gcc -y
echo
git clone https://github.com/dartokloning/vlmcsd
echo
cd vlmcsd && make && cd bin && ./vlmcsd && ./vlmcs
echo
./vlmcs
cp vlmcsd /usr/bin
cp vlmcs /usr/bin
echo
firewall-cmd --zone=public --permanent --add-port=1688/tcp
firewall-cmd --reload
firewall-cmd --list-port
echo
iptables -A INPUT -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 1688 -j ACCEPT
iptables -L -n
cd /etc/init.d/
wget http://180.232.9.204:8000/data/OPENVPN-AS/vlmcsd
chmod 755 /etc/init.d/vlmcsd
chown root.root /etc/init.d/vlmcsd
chkconfig --add vlmcsd
chkconfig vlmcsd on
chkconfig vlmcsd start
systemctl start vlmcsd
systemctl status vlmcsd
echo
echo "===============Setup KMS Success==============="
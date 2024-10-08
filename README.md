#!/bin/sh
# KMSServer
cd /tmp/ && yum install git -y && git clone https://github.com/income88/KMSServer && cd KMSServer/ && sed -i -e 's/\r$//' InstallKMS.sh && chmod 755 InstallKMS.sh && ./InstallKMS.sh

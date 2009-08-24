#!/bin/sh
#      __________  ________________  __  _______ 
#     / ____/ __ \/ ____/ ____/ __ )/ / / / ___/
#    / /_  / /_/ / __/ / __/ / __  / / / /\__ \ 
#   / __/ / _, _/ /___/ /___/ /_/ / /_/ /___/ / 
#  /_/   /_/ |_/_____/_____/_____/\____//____/  
#
# Copyright (c) 2009 Matthias Fechner <matthias@fechner.net>
#

# Install necessary packages
cd /tmp
opkg update
opkg install setserial
opkg install uclibcxx
opkg install pthsem
wget http://www.ouaye.net/linknx/OpenWRT-Kamikaze-r7908/eibd_0.0.2.1-10_mipsel.ipk
opkg install eibd_0.0.2.1-10_mipsel.ipk
rm eibd_0.0.2.1-10_mipsel.ipk
#wget "http://downloads.sourceforge.net/project/linknx/linknx-bin/linknx-0.0.1.26/linknx-0.0.1.26-OpenWRT-WhiteRussian-RC6.tgz?use_mirror=surfnet"
#tar xzvf linknx*
#rm readme.txt
#ipkg install linknx_0.0.1.26-2_mipsel.ipk
#rm linknx*

#/home/idefix/edimax/libcurl_7.14.0-1_mipsel.ipk
#/home/idefix/edimax/libesmtp_1.0.4-2_mipsel.ipk
#/home/idefix/edimax/liblua_5.1.4-2_mipsel.ipk
#/home/idefix/edimax/libreadline_5.0-1_mipsel.ipk
#/home/idefix/edimax/linknx_0.0.1.23-1_mipsel.ipk
#/home/idefix/edimax/lua_5.1.4-2_mipsel.ipk
#/home/idefix/edimax/luac_5.1.4-2_mipsel.ipk

# setup serial interface
setserial /dev/ttyS1 irq 3 autoconfig

# Create startup file
touch /etc/init.d/eibd
echo "#!/bin/sh /etc/rc.common" >/etc/init.d/eibd
echo "# Copyright (c) 2009 Matthias Fechner <matthias@fechner.net>" >>/etc/init.d/eibd
echo "" >>/etc/init.d/eibd
echo "START=99" >>/etc/init.d/eibd
echo "start() {" >>/etc/init.d/eibd
echo "	eibd -d -i -D -T -S ft12:/dev/ttyS1" >>/etc/init.d/eibd
echo "}" >>/etc/init.d/eibd
echo "" >>/etc/init.d/eibd
echo "stop() {" >>/etc/init.d/eibd
echo "	killall eibd" >>/etc/init.d/eibd
echo "}" >>/etc/init.d/eibd
echo "" >>/etc/init.d/eibd
chmod 755 /etc/init.d/eibd
/etc/init.d/eibd enable
reboot


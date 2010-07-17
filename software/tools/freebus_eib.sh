#!/bin/sh
#      __________  ________________  __  _______ 
#     / ____/ __ \/ ____/ ____/ __ )/ / / / ___/
#    / /_  / /_/ / __/ / __/ / __  / / / /\__ \ 
#   / __/ / _, _/ /___/ /___/ /_/ / /_/ /___/ / 
#  /_/   /_/ |_/_____/_____/_____/\____//____/  
#
# Copyright (c) 2009 Matthias Fechner <matthias@fechner.net>
# $Id$

getKernelVersion()
{
    KERNELVERSION=`uname -r | head -c 3`
}

getSerialDevice()
{
    if [ "$KERNELVERSION" = "2.4" ]; then
       echo "Found kernel version 2.4"
       if [ "$EDIMAX" = "1" ]; then
          SERIALDEVICE="/dev/ttyS0"
       else
          SERIALDEVICE="/dev/tts/1"
       fi
    elif [ "$KERNELVERSION" = "2.6" ]; then
       echo "Found kernel version 2.6"
       if [ "$EDIMAX" = "1" ]; then
          SERIALDEVICE="/dev/ttyS0"
       else
          SERIALDEVICE="/dev/ttyS1"
       fi
    fi
    echo "Use serial device: $SERIALDEVICE"
}

checkOS()
{
    if test -f /usr/bin/ipkg; then
        if test -f /etc/ipkg.conf; then
            echo "Found Edimax Router"
            EDIMAX=1
        fi
    fi
    getKernelVersion
    getSerialDevice
}

checkJffs()
{
    echo
    echo -n Checking for JFFS2 filesystem...
    if grep jffs /etc/mtab >/dev/null; then
        echo " found."
        return 0
    fi
    # if we install on edimax skip this test
    if [ "$EDIMAX" = "1" ]; then
        echo " skipped (seems to be Edimax router)"
        return 0
    fi
    echo " failed, cancel installation"
    exit 1
}

searchInstaller()
{
    echo -n Checking for installer tool...
    # check for ipkg or opkg
    if test -f /bin/ipkg; then
        echo " found ipkg."
        INSTALL=/bin/ipkg
    elif test -f /usr/bin/ipkg; then
        echo " found ipkg."
        INSTALL=/usr/bin/ipkg
    elif test -f /bin/opkg; then
        echo " found opkg."
        INSTALL=/bin/opkg
    else
        echo " failed, no ipkg or opkg found, installation canceled"
        exit 1
    fi
}

setupSource()
{
    if [ "$EDMIAX" = "1" ]; then
        echo "Update /etc/ipkg.conf"
        echo "# that exists on the target system." >/etc/ipkg.conf
        echo "src picprojects http://www.picinternetprojects.247n.com/packages" >>/etc/ipkg.conf
        echo "src picprojectsSDK http://www.picinternetprojects.247n.com/packages/sdk" >>/etc/ipkg.conf
        echo "src openwrt-kamikaze http://downloads.openwrt.org/kamikaze/8.09/adm5120/packages" >>/etc/ipkg.conf
        echo "#src a" >>/etc/ipkg.conf
        echo "dest root /" >>/etc/ipkg.conf
        echo "dest local /usr/local" >>/etc/ipkg.conf
        echo "dest ram /ram" >>/etc/ipkg.conf
        echo "dest usb /mnt/usb" >>/etc/ipkg.conf
	echo "src freebus http://server.idefix.lan/eibd/packages" >> >>/etc/ipkg.conf
    else
	echo "src freebus http://server.idefix.lan/eibd/packages" >> >>/etc/opkg.conf
    fi
}

installPackages()
{
    echo
    echo "Install packages"
    cd /tmp
    echo Update package list...
    if $INSTALL -V0 update 2>&1 /dev/null; then
        echo " done."
    else
        echo " failed, cancel installation."
        exit 1
    fi
    echo -n Install pthsem...
    if $INSTALL -V0 install pthsem; then
        echo " done."
    else
        echo " failed, cancel installation."
        exit 1
    fi
    echo -n Install eibd...
    if $INSTALL -V0 install eibd; then
        echo " done."
    else
        echo " failed, cancel installation."
        exit 1
    fi
}

# to have debugging use eibd -t 1023 -i -D -T -S ft12:/dev/ttyS1
createStartup()
{
    echo -n "Creating eibd startup file..."
    if ! touch /etc/init.d/eibd; then
        echo " failed, could not create /etc/init.d/eibd"
        exit 1
    fi
    echo "#!/bin/sh /etc/rc.common" >/etc/init.d/eibd
    echo "# Copyright (c) 2009 Matthias Fechner <matthias@fechner.net>" >>/etc/init.d/eibd
    echo "" >>/etc/init.d/eibd
    echo "START=99" >>/etc/init.d/eibd
    echo "start() {" >>/etc/init.d/eibd
    echo "	eibd -d -i -D -T -S ft12:$SERIALDEVICE" >>/etc/init.d/eibd
    echo "}" >>/etc/init.d/eibd
    echo "" >>/etc/init.d/eibd
    echo "stop() {" >>/etc/init.d/eibd
    echo "	killall eibd" >>/etc/init.d/eibd
    echo "}" >>/etc/init.d/eibd
    echo "" >>/etc/init.d/eibd
    if chmod 755 /etc/init.d/eibd; then
        echo " done."
    else
        echo " failed, could not set permissions on /etc/init.d/eibd"
        exit 1
    fi
    echo -n Enable startup script...
    if [ "$EDMIAX" = "1" ]; then
        mv /etc/init.d/eibd /etc/init.d/S70eibd
        if test -f /etc/init.d/S70eibd; then
            echo " done."
        else
            echo " failed."
        fi
    else
        cd /etc/rc.d
        ln -fs ../init.d/eibd /etc/rc.d/S70eibd 
        if test -f /etc/rc.d/S70eibd; then
            echo " done."
        else
            echo " failed."
        fi
    fi

}

doReboot()
{
    echo
    echo Installation finished, rebooting
    echo
    reboot
}

# Try to figure out which router we have here
checkOS

# Check if jffs filesystem is mounted, if not cancel installation
checkJffs

# search for installer, if no installer found cancel installation
searchInstaller

# Install necessary packages
setupSource
installPackages

# Create startup file
createStartup

#reboot
doReboot


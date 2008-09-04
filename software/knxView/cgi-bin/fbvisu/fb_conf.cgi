#!/bin/sh
# derived from index.cgi
# if you click on a command link in both_ports_out_test.html
# you get the name of a script for both_ports_out_test.cgi to run (page = zzzz)
# and a string (string = xxxx) for the script to deal with


#Decode query string
IFS="&"
for QUERY_PARTS in $QUERY_STRING; do
    QKEY="`echo $QUERY_PARTS | cut -d '=' -f 1`"
    QVAL="`echo $QUERY_PARTS | cut -d '=' -f 2`"
    eval "$QKEY="$QVAL""
done

# in case of testing on host
FSROOT=`expr $SCRIPT_FILENAME : '\(.*\)/var/www/cgi-bin/'`
export FSROOT

#Load config
if [ -e /tmp/rs232ws.conf ]; then
    . /tmp/rs232ws.conf
else
    cp $FSROOT/etc/rs232ws.conf /tmp/rs232ws.conf
    . /tmp/rs232ws.conf
fi

cat < /dev/ttyS0 > /dev/null &
catPid=$!
sleep 1
kill $catPid

rm -f /var/www/ramdisk/rsin

echo "fbrpa" > /dev/ttyS0
cat < /dev/ttyS0 > /var/www/ramdisk/rsin &
catPid=$!
sleep 1
kill $catPid
chmod 777 /var/www/ramdisk/rsin
rsindata=`cat /var/www/ramdisk/rsin`


echo "Content-type: text/html"
echo

cat /var/www/fb_conf1.html

echo $rsindata

cat /var/www/fb_conf2.html


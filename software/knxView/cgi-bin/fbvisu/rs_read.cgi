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

rsindata=`cat /var/www/ramdisk/rsin`
echo $rsindata



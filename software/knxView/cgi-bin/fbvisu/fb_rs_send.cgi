#!/bin/sh

#Decode query string
for QUERY_PARTS in $QUERY_STRING; do
    QKEY="`echo $QUERY_PARTS | cut -d '=' -f 1`"
    QVAL="`echo $QUERY_PARTS | cut -d '=' -f 2`"
done

# Befehl über den EIB Bus senden
echo $QKEY=$QVAL>/dev/ttyS0

# Schreibe Wert in die Datenbank
#$GA=${$QKEY:6} 

#sqlite fb.sdb "update eib set state='$QVAL' where GA='1.4.7'"
#sqlite fb.sdb "update eib set state='$QVAL' where GA='$GA'"

#/usr/bin/php fbWriteDB.php?GA=fbs01/01/4/007&state=0

echo "Content-type: text/html"
echo
cat /var/www/goback.html
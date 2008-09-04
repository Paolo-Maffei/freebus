#!/bin/sh
#Decode query string
IFS="&"
for QUERY_PARTS in $QUERY_STRING; do
    QKEY="`echo $QUERY_PARTS | cut -d '=' -f 1`"
    QVAL="`echo $QUERY_PARTS | cut -d '=' -f 2`"
    eval "`httpd -d "$QKEY"`=\"`httpd -d "$QVAL"`\""
    #eval "$QKEY=\"$QVAL\""
done





# when the page is first opened load the text from pg-default.sh
# this page is addressed like ->
#           LCDsend.cgi?page=LCDsend&string=HARRY

# thus if page=LCDsend the script we run will be pg-LCDsend.sh
# and HARRY will be sent to it

# has the variable page been given a value?
if [ -e "pg-$page.sh" ]; then
    inc="./pg-$page.sh"
# if not then show the default text
else
    inc="./pg-default.sh"
    page="default"
fi



echo "Content-type: text/html"
echo

#send LCDsend.html which is the first part of the html page
cat ../../rs232ws/LCDsend.html
echo "<!-- Content goes here -->"
. $inc
echo "<!-- End of content -->"
echo "Router uptime: `cat /proc/uptime | cut -d ' ' -f 1` seconds.<br>"
echo `date`
echo "<BR>"
# now finish the html
echo "<BR></body></html>"
#cat ../../rs232ws/end.html

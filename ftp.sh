#!/bin/bash 
ftp -inv $FTPIP $FTPPORT <<EOF
user $FTPLOGIN $FTPPASS
cd $API_FOLDER
send $PACKAGE
bye
EOF
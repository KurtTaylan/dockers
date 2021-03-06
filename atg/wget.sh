#!/bin/sh

#
# Generated onTue May 03 10:08:04 PDT 2016# Start of user configurable variables
#
LANG=C
export LANG

# SSO username and password
#read -p 'SSO User Name:' SSO_USERNAME
#read -sp 'SSO Password:' SSO_PASSWORD
SSO_USERNAME=jclark@foxmail.com
SSO_PASSWORD=123abcABC

# Path to wget command
WGET=/usr/bin/wget
# Location of cookie file
COOKIE_FILE=/tmp/$$.cookies

# Log directory and file
LOGDIR=/tmp
LOGFILE=$LOGDIR/wgetlog-`date +%m-%d-%y-%H:%M`.log
# Output directory and file
OUTPUT_DIR=/tmp
#
# End of user configurable variable
#

if [ "$SSO_PASSWORD " = " " ]
then
 echo "Please edit script and set SSO_PASSWORD"
 exit
fi

# Contact osdc site so that we can get SSO Params for logging in
SSO_RESPONSE=`$WGET --user-agent="Mozilla/5.0" --no-check-certificate https://edelivery.oracle.com/osdc/faces/SearchSoftware 2>&1|grep Location`

# Extract request parameters for SSO
SSO_TOKEN=`echo $SSO_RESPONSE| cut -d '=' -f 2|cut -d ' ' -f 1`
SSO_SERVER=`echo $SSO_RESPONSE| cut -d ' ' -f 2|cut -d '/' -f 1,2,3`
SSO_AUTH_URL=/sso/auth
AUTH_DATA="ssousername=$SSO_USERNAME&password=$SSO_PASSWORD&site2pstoretoken=$SSO_TOKEN"

# The following command to authenticate uses HTTPS. This will work only if the wget in the environment
# where this script will be executed was compiled with OpenSSL. Remove the --secure-protocol option
# if wget was not compiled with OpenSSL
# Depending on the preference, the other options are --secure-protocol= auto|SSLv2|SSLv3|TLSv1
$WGET --user-agent="Mozilla/5.0" --post-data $AUTH_DATA --save-cookies=$COOKIE_FILE --keep-session-cookies $SSO_SERVER$SSO_AUTH_URL -O sso.out >> $LOGFILE 2>&1

rm -f sso.out




  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V78201-01.zip&token=RllyZlo0YzA2WWttOXpXRUY1Y1c4USE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9ODI4NTA1NTkmYXJ1PTE5NDI1MDEzJmFncmVlbWVudElkPTE0Mjk3NzQmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTU0MDM4MiZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMi4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9NDYyMDc2JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V78201-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V78217-01.zip&token=Y2dkZFVTNmVabnlQdzVZbTU1YjlvUSE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9ODI4NTM1NjImYXJ1PTE5NDI1NDk2JmFncmVlbWVudElkPTE0Mjk3NzQmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTU0MDM4MiZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMi4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9NDYyMzE3JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V78217-01.zip >> $LOGFILE 2>&1

#!/bin/bash
/usr/bin/sadf -d /var/log/sa/sa$(date "+%d") -- -u -r -dp -n DEV >> /tmp/sysreport-$(date "+%m-%d").txt
/usr/bin/echo /tmp/sysreport-$(date "+%d").txt | /usr/bin/mutt -s sysreport jebel@muckrobin

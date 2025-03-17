#!/bin/sh
#delete old dnsmasq config file
logger -t "gfwlist2dnsmasq" "deleting old custom.conf..."
rm -f /etc/dnsmsaq.d/custom.conf
#update new dnsmasq config file
logger -t "gfwlist2dnsmasq" "updating new custom.conf..."
/usr/bin/gfwlist2dnsmasq.sh -d 127.0.0.1 -p 6054 -s gfwlist,gfwlist6 --extra-domain-file /etc/dnsmasq_extra/extra_domain.txt -o /etc/dnsmasq.d/custom.conf
#restart dnsmasq
logger -t "gfwlist2dnsmasq" "restarting dnsmasq..."
/etc/init.d/dnsmasq restart


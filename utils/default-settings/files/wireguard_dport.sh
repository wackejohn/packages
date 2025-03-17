#!/bin/sh
listen_port=$(uci get network.vpn0.listen_port)
logfile=/var/log/iptables
while inotifywait -qq -s -e modify $logfile
do
	for i in $(seq 1 4)
	do
		port=$(cat $logfile | grep IN=pppoe-wan$i | grep WG_WAN$i | tail -1 | sed 's/^.*\(SPT.*\).*$/\1/' | cut -d " " -f 1 | sed 's/SPT=//')
		case $i in
			1)
			rt=1
			;;
			2)
			rt=3
			;;
			3)
			rt=5
			;;
			4)
			rt=7
			;;
		esac
		if [ "$port" != "" ] && [ $(ip rule show | grep -c $port) = "0" ] && [ "$(wg show vpn0 | grep endpoint | cut -d ":" -f 3 | grep -c $port)" != "0" ] ; then
			ip rule add dport $port lookup $rt
		fi
	done
	
	ip rule show | grep dport | sed 's/^.*\(dport.*\).*$/\1/' | sed 's/^/ip rule del &/g' > /tmp/wireguard_iprule.sh
	chmod +x /tmp/wireguard_iprule.sh	

	peer_num=$(wg show vpn0 | grep -c endpoint)
	if [ $peer_num != "0"  ]; then
		for i in $(seq 1 $peer_num)
		do
			endpoint_port=$(wg show vpn0 | grep endpoint | cut -d ":" -f 3 | sed -n ${i}p)
			sed -i "/$endpoint_port/d" /tmp/wireguard_iprule.sh
		done
		/tmp/wireguard_iprule.sh
	else
		/tmp/wireguard_iprule.sh
	fi
done

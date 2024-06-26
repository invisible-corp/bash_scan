#! /bin/bash

source ./cyber_scan/lib/settings/services.sh
source ./cyber_scan/lib/scan/helpers/inputs.sh
source ./cyber_scan/lib/settings/tor.sh
source ./cyber_scan/validators/ipv4_validator.sh
source ./cyber_scan/lib/scan/helpers/create_dir.sh
source ./cyber_scan/lib/util/success_output.sh
source ./cyber_scan/assets/set_color.sh

function manipulative_scan()
{
	services "TCP Manipulative"

        proxychains_input
        if [[ $proxychains == [Yy] ]]; then
		tor_service
                is_tor="proxychains"
        else
                is_tor=""
        fi

	dns_input
       	ipv4_validator "$dns"
        if [ $? -ne 0 ]; then
                return 1
        fi

	ports_input

	debug_mode
	if [[ $debug == [Yy] ]]; then
		debug_flag="-d"
	else
		debug_flag=""
	fi

	scripts_input

	dir_input
	create_dir "$dir_name/manipulative_scan"


	$is_tor nmap -sM -p "$ports" -sV \
	 -f --send-eth -D RND:3 \
	 --script="$scripts" --script-args="$args" $debug_flag \
	 -oN "scan_victims/$dir_name/manipulative_scan/$dns.nmap" "$dns"

	success_output "$dir_name" "manipulative_scan" "$dns.nmap"
}

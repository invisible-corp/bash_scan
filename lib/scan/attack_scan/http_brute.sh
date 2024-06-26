#! /bin/bash

source ./cyber_scan/lib/settings/services.sh
source ./cyber_scan/lib/scan/helpers/inputs.sh
source ./cyber_scan/validators/ipv4_validator.sh
source ./cyber_scan/lib/scan/helpers/create_dir.sh
source ./cyber_scan/lib/util/success_output.sh
source ./cyber_scan/assets/set_color.sh

function http_brute_attack()
{
        services "HTTP brute attack"


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

	debug_mode
	if [[ $debug == [Yy] ]]; then
		debug_flag="-d"
	else
		debug_flag=""
	fi

	method_input

        dir_input
        create_dir "$dir_name/attacks/http_brute"


        $is_tor nmap -p80 --script=http-brute \
         --script-args=http-brute."$method" $debug_flag \
	 -f --send-eth -D RND:3 \
         -oN "scan_victims/$dir_name/attacks/http_brute/$dns.nmap" "$dns"

        success_output "$dir_name" "attacks/http_brute" "$dns.nmap"
}

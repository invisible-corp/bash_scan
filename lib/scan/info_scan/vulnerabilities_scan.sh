#! /bin/bash

source ./cyber_scan/lib/settings/services.sh
source ./cyber_scan/lib/scan/helpers/inputs.sh
source ./cyber_scan/validators/domain_validator.sh
source ./cyber_scan/validators/ipv4_validator.sh
source ./cyber_scan/validators/cvss_score_validator.sh
source ./cyber_scan/lib/scan/helpers/create_dir.sh
source ./cyber_scan/lib/util/success_output.sh
source ./cyber_scan/assets/set_color.sh

function vulnerabilities_scan()
{
	echo "$(set_color "yellow")WARNING:$(set_color "*") We do not use proxychains in this script..."

	services "Vulnerabilities scan"

	domain_input
	domain_validator $domain
        if [ $? -ne 0 ]; then
                return 1
        fi

	cvss_score_input
	cvss_score_validator $cvss_score

	debug_mode
	if [[ $debug == [Yy] ]]; then
		debug_flag="-d"
	else
		debug_flag=""
	fi

	dir_input
	create_dir "$dir_name/vulnerabilities"


	nmap -sV -f --send-eth -D RND:3 \
	 --script=vulners --script-args=vulners.mincvss=$cvss_score $debug_flag \
	 -oN "scan_victims/$dir_name/vulnerabilities/$domain.nmap" $domain

	success_output "$dir_name" "vulnerabilities" "$domain.nmap"
}

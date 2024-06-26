#! /bin/bash

source ./cyber_scan/menus/info_menu.sh
source ./cyber_scan/lib/scan/helpers/inputs.sh
source ./cyber_scan/lib/scan/info_scan/waf_scan.sh
source ./cyber_scan/lib/scan/info_scan/syn_ack_scan.sh
source ./cyber_scan/lib/scan/info_scan/tcp_connect_scan.sh
source ./cyber_scan/lib/scan/info_scan/tcp_null_scan.sh
source ./cyber_scan/lib/scan/info_scan/manipulative_scan.sh
source ./cyber_scan/lib/scan/info_scan/xmas_scan.sh
source ./cyber_scan/lib/scan/info_scan/aggressive_scan.sh
source ./cyber_scan/lib/scan/info_scan/vulnerabilities_scan.sh
source ./cyber_scan/lib/util/errors.sh
source ./cyber_scan/assets/set_color.sh

function info_scan()
{
	while true; do
		info_menu
		menu_input

		case $choice in
			1)
				waf_scan
				continue_using
				;;
			2)
				syn_ack_scan
				continue_using
				;;
			3)
				tcp_connect_scan
				continue_using
				;;
			4)
				tcp_null_scan
				continue_using
				;;
			5)
				manipulative_scan
				continue_using
				;;
			6)
				xmas_scan
				continue_using
				;;
			7)
				aggressive_scan
				continue_using
				;;
			8)
				vulnerabilities_scan
				continue_using
				;;
			0)
				break
				;;
			*)
				invalid_menu_input
				continue_using
				;;
		esac
	done
}

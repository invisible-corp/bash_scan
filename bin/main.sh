#! /bin/bash

#source ./cyber_scan/assets/ascii.sh
source ./cyber_scan/menus/menu.sh
source ./cyber_scan/lib/scan/helpers/inputs.sh
source ./cyber_scan/lib/dns/get_dns.sh
source ./cyber_scan/lib/scan/info_scan/info_scan.sh
source ./cyber_scan/lib/scan/attack_scan/attack_scan.sh
source ./cyber_scan/lib/util/errors.sh
source ./cyber_scan/assets/set_color.sh


function main()
{
	#display_ascii_art

	while true; do
		menu
		menu_input

		case $choice in
			1)
				get_dns
				continue_using
				;;
			2)
				info_scan
				;;
			3)
				attack_scan
				;;
			0)
				echo "$(set_color "purple")Goodbye!$(set_color "*")"
				return 1
				;;
			*)
				invalid_menu_input
				continue_using
				;;
		esac
	done
}

main

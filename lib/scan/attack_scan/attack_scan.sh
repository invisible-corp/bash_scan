#! /bin/bash

source ./cyber_scan/menus/attack_menu.sh
source ./cyber_scan/lib/scan/helpers/inputs.sh
source ./cyber_scan/lib/scan/attack_scan/dos_attack.sh
source ./cyber_scan/lib/scan/attack_scan/http_brute.sh
source ./cyber_scan/lib/scan/attack_scan/ssh_brute.sh
source ./cyber_scan/lib/scan/attack_scan/wordpress_attack.sh
source ./cyber_scan/lib/util/errors.sh
source ./cyber_scan/assets/set_color.sh

function attack_scan()
{
	while true; do
		attack_menu
		menu_input

		case $choice in
			1)
				echo "Dos attack is under maintenance..."
				dos_attack
				continue_using
				;;
			2)
				echo "HTTP brute attack is under maintenance..."
				http_brute
				continue_using
				;;
			3)
				echo "SSH brute attack is under maintenance..."
				ssh_brute
				continue_using
				;;
			4)
				echo "Wordpress attack is under maintenance..."
				wordpress_attack
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

#! /bin/bash

source ./cyber_scan/lib/settings/services.sh
source ./cyber_scan/validators/domain_validator.sh
source ./cyber_scan/lib/scan/helpers/inputs.sh
source ./cyber_scan/lib/dns/extract_ips.sh
source ./cyber_scan/lib/util/success_output.sh
source ./cyber_scan/assets/set_color.sh

function get_dns()
{
	domain_input
	base_name=$(domain_validator "$domain")
	if [ $? -ne 0 ]; then
        	return 1
    	fi

	dir_input

	website_name=$(echo "$base_name" | sed 's/\..*//')
	servers_names_file="scan_victims/$dir_name/servers.txt"
	info_file="scan_victims/$dir_name/info.txt"

	mkdir -p "scan_victims/$dir_name"
	touch -c "$info_file"


	echo "Victim: $base_name" > "$info_file"

	proxychains nslookup "$base_name" | grep "Address: " >> "$info_file" \
	 || { echo "$(set_color "red")Error:$(set_color "*") Failed to execute nslookup. Aborting."; return 1; }

	proxychains host -t ns "$base_name" >> "$servers_names_file" \
	 || { echo "$(set_color "red")Error:$(set_color "*") Failed to execute host. Aborting."; return 1; }

	if [[ ! -s "$servers_names_file" ]]; then
		echo "$(set_color "red")Error:$(set_color "*") No IP addresses found for the website. Aborting."
            	return 1
        fi

	extract_ips "$servers_names_file" \
	 || { echo "$(set_color "red")Error:$(set_color "*") Failed to extract IP addresses. Aborting."; return 1; }

	rm "$servers_names_file" \
	 || { echo "$(set_color "yellow")Warning:$(set_color "*") Failed to remove temporary file '$servers_names_file'."; }

	success_output "$dir_name" "$info_file"
}

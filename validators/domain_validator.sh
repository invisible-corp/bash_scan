#! /bin/bash

source ./cyber_scan/validators/helpers/get_base_name.sh
source ./cyber_scan/validators/helpers/is_url.sh
source ./cyber_scan/assets/set_color.sh

function domain_validator()
{
	local domain="$1"

  	if [[ -z "$domain" ]]; then
    		echo "$(set_color "red")Domain cannot be empty.$(set_color "*")" >&2
    		return 1
  	fi

	if is_url "$domain"; then
        	base_name=$(get_base_name "$domain")
        	echo "$base_name"
        	return 0
    	fi

	if [[ ! "$domain" =~ ^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        	echo "$(set_color "red")Invalid domain name:$(set_color "*") $domain" >&2
        	return 1
    	fi

	echo "$domain"
}

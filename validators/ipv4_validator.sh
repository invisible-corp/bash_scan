#! /bin/bash

source ./cyber_scan/assets/set_color.sh

function ipv4_validator()
{
	local ipv4="$1"

	if [[ "$ipv4" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}(\/[0-9]{1,2})?$ ]]; then
        	local IFS='.'
        	local octets=($ipv4)
        	local valid=true

		for octet in "${octets[@]}"; do
            		if ! [[ "$octet" -ge 0 && "$octet" -le 255 ]]; then
                		valid=false
                		break
            		fi
        	done

        	if $valid; then
            		return 0
        	else
            		return 1
        	fi
    	else
        	echo "$(set_color "red")Invalid IPv4 format:$(set_color "*") $ipv4"
        	return 1
    	fi
}

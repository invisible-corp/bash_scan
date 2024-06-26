#! /bin/bash

source ./cyber_scan/assets/set_color.sh

function ports_validator()
{
	local ports="$1"

	if [[ ! "$ports" =~ ^[0-9]+(,[[:space:]]*[0-9]+)*$ ]]; then
		echo "$(set_color "red")Invalid port(s), port(s) should be number(s)..."
		exit 1
	fi

	IFS=',' read -ra port_list <<< "$ports"
    	for port in "${port_list[@]}"; do
        	if (( port < 1 || port > 65535 )); then
            		echo "Invalid port number: '$port'. Port must be in the range 1-65535." >&2
            		exit 1
        	fi
    	done

}

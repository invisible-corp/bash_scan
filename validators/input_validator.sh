#! /bin/bash

source ./cyber_scan/assets/set_color.sh

function input_validator()
{
	local debug="$1"

	if [[ $debug =~ ^[YyNn]$ ]]; then
        	return 0
    	else
        	echo "$(set_color "red")Unknown character, please, try again...$(set_color "*")" >&2
		exit 1
    	fi
}

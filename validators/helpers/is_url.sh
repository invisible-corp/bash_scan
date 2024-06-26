#! /bin/bash

function is_url()
{
	local url="$1"

	if [[ $url =~ ^(https?|ftp):// ]]; then
		return 0
	else
		return 1
	fi
}

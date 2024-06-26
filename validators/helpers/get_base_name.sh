#! /bin/bash

function get_base_name()
{
	local url="$1"
	local base_name=$(echo "$url" | sed 's/^https\?:\/\///' | sed 's/\/$//' | cut -d'/' -f1)

	echo "$base_name"
}

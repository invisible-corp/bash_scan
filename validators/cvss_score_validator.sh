#! /bin/bash

source ./cyber_scan/assets/set_color.sh

function cvss_score_validator()
{
	local cvss_score="$1"

	if [[ -z "$cvss_score" ]]; then
		return 0
	fi

	if [[ ! "$cvss_score" =~ ^[0-9.]+$ ]]; then
		echo "$(set_color "red")Invalid cvss score, please, try again...$(set_color "*")" >&2
		exit 1
	fi
}

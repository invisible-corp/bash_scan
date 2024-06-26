#! /bin/bash

source ./cyber_scan/lib/settings/network_manager.sh

function services()
{
	local option="$1"

	echo "Preparing configuration before $option..."

	network_manager
}

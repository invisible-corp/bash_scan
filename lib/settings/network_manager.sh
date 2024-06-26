#! /bin/bash

source ./cyber_scan/assets/set_color.sh

network_status=$(service NetworkManager status)
network_start=$(service NetworkManager start)

function network_manager()
{
	echo "checking NetworkManager status..."

	local network_output

        if echo "$network_status" | grep -q "Active: active"; then
                echo "service NetworkManager is running. $(set_color "green")✓$(set_color "*")"
        else
                echo "NetworkManager is down."
                echo "starting NetworkManager..."

                if network_output=$($network_start 2>&1); then
                        echo "$(set_color "green")Success ✓$(set_color "*")\n"
                else
                        echo "$(set_color "red")Error:$(set_color "*") error starting NetworkManager."
                        echo "$network_output"
			return 1
                fi
        fi
}


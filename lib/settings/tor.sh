#! /bin/bash

source ./cyber_scan/assets/set_color.sh

tor_status=$(service tor status)
tor_start=$(service tor start)

function tor_service()
{
        echo "checking Tor status..."

	local tor_output

        if echo "$tor_status" | grep -q "Active: active"; then
                echo "Service Tor is running. $(set_color "green")✓$(set_color "*")"
        else
                echo "Tor is down."
                echo "Starting Tor..."

                if tor_output=$($tor_start 2>&1); then
                        echo -e "\n$(set_color "green")Success ✓$(set_color "*")\n"
                else
                        echo "$(set_color "red")Error:$(set_color "*") error starting Tor."
                        echo "$tor_output"
                        return 1
                fi
        fi
}


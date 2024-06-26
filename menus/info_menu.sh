#! /bin/bash

source ./cyber_scan/assets/ascii.sh
source ./cyber_scan/assets/set_color.sh

function info_menu()
{
	clear
	display_ascii_art
        echo -e "\n$(set_color "purple")----------------------------------------------------------------------------------------------$(set_color "*")"
	echo -e "\nScan menu: "
	echo "$(set_color "purple")[1]$(set_color "*") - WAF detection"
	echo "$(set_color "purple")[2]$(set_color "*") - SYN/ACK scaning"
	echo "$(set_color "purple")[3]$(set_color "*") - TCP Connect() scaning"
	echo "$(set_color "purple")[4]$(set_color "*") - TCP NULL scaning"
	echo "$(set_color "purple")[5]$(set_color "*") - TCP Manipulative scaning"
	echo "$(set_color "purple")[6]$(set_color "*") - Xmas scaning"
	echo "$(set_color "purple")[7]$(set_color "*") - Aggressive scaning"
	echo "$(set_color "purple")[8]$(set_color "*") - Vulnerabilities scaning"
	echo "$(set_color "purple")[0]$(set_color "*") <- Menu"
}

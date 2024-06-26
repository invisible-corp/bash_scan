#! /bin/bash

source ./cyber_scan/assets/set_color.sh

function success_output()
{
	local dir_name="$1"
	local scan_name="$2"
	local file_name="$3"

	echo -e "\n$(set_color "green")Success ✓$(set_color "*")\n"
	echo "$(set_color "purple")Output is here:$(set_color "*") scan_victims/$dir_name/$scan_name/$file_name"
}

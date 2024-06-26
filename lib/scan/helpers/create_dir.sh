#! /bin/bash

function create_dir()
{
	local dir_name="$1"

	mkdir -p "scan_victims/$dir_name"
}

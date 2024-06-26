#! /bin/bash

source ./cyber_scan/validators/input_validator.sh
source ./cyber_scan/validators/ports_validator.sh

function menu_input()
{
	read -p "Enter your choice: " choice
}

function continue_using()
{
	echo "$(set_color "green")Press any button to continue...$(set_color "*")"
	read -r
}

function proxychains_input()
{
	read -p "Do you want to use Tor proxychains (ex.: Yy/Nn)?" proxychains
	input_validator "$proxychains"
}

function domain_input()
{
	read -p "Provide url or domain name (ex.: example.com): " domain
}

function dns_input()
{
	read -p "Provide DNS of the website (ex.: 45.33.49.119): " dns
}

function method_input()
{
	read -p "Provide HTTP Method (ex.: GET): " method
}

function ports_input()
{
	read -p "Provide ports of the website that you want to scan or skip it (ex.: 22,80,443): " ports

	if [[ -z "$ports" ]]; then
    		ports="-"
  	fi

	ports_validator "$ports"
}

function scripts_input()
{
	echo "The scripts' location is in /usr/share/nmap/scripts"
	read -p "Provide scripts you want to execute (ex.: http-waf-detect): " scripts
	read -p "Provide scripts' args if necessary (ex.: ssh-run.cmd=ls -l /, ssh-run.username=root): " args
}

function debug_mode()
{
	read -p "Do you want to enable debugging mode (ex.: Yy/Nn): " debug
	input_validator "$debug"
}

function cvss_score_input()
{
	read -p "Enter CVSS score or skip (ex.: 7.0): " cvss_score
}

function dir_input()
{
	read -p "Provide a directory name: " dir_name
}
